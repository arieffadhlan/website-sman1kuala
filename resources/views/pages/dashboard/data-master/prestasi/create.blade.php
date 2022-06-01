<x-app-layout>
    @push('styles')
        <style>
            .ck.ck-content:not(.ck-comment__input *) {
                height: 200px;
                overflow-y: auto;
            }    
        </style>
    @endpush
    
    <h1 class="mb-7 font-semibold text-2xl text-primary">Tambah Data Prestasi</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Tambah Data Prestasi</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('prestasi.store') }}">
            @csrf
            <div>
                <x-label for="nama_prestasi" value="Nama Prestasi" />
                <x-input type="text" name="nama_prestasi" id="nama_prestasi" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_prestasi')" placeholder="Masukkan nama prestasi" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="deskripsi" value="Deskripsi" />
                <textarea name="deskripsi" class="editor">
                    {{ old('deskripsi') }}
                </textarea>
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>

    @push('scripts')
        <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
        <script>
            ClassicEditor
                .create( document.querySelector('.editor') )
                .catch( error => {
                    console.error( error );
                } );
        </script>
    @endpush
</x-app-layout>