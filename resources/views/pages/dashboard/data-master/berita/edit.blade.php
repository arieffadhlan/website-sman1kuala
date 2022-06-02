<x-app-layout>    
    @push('styles')
        <style>
            .ck.ck-content:not(.ck-comment__input *) {
                height: 200px;
                overflow-y: auto;
            }    
        </style>
    @endpush
    
    <h1 class="mb-7 font-semibold text-2xl text-primary">Edit Data Berita</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Berita</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('berita.update', $newsPost->id) }}" enctype="multipart/form-data">
            @csrf
            @method('put')
            <div>
                <x-label for="foto" value="Foto" class="mb-1" />
                <x-input type="file" name="foto" id="foto" class="file:!ml-0 file:!py-2 file:!px-4 file:rounded-lg file:!bg-dashboard/10 file:!text-dashboard hover:file:!bg-dashboard/20 active:file:!bg-dashboard/30 block w-full text-primary/80" :value="old('foto', $newsPost->foto)" placeholder="Masukkan foto berita" />
            </div>
            <div class="mt-5">
                <x-label for="judul" value="Judul" />
                <x-input type="text" name="judul" id="judul" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('judul', $newsPost->judul)" placeholder="Masukkan nama judul" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="deskripsi" value="Deskripsi" />
                <textarea name="deskripsi" class="editor">
                    {{ old('deskripsi', $newsPost->deskripsi) }}
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