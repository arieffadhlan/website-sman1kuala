<x-app-layout>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Tambah Data Fasilitas</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Tambah Data Fasilitas</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('fasilitas.store') }}" enctype="multipart/form-data">
            @csrf
            <div>
                <x-label for="nama_fasilitas" :value="__('Nama Fasilitas')" />
                <x-input type="text" name="nama_fasilitas" id="nama_fasilitas" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_fasilitas')" placeholder="Masukkan Nama Fasilitas" autofocus />
            </div>
            <div class="mt-5">
                <x-label for="deskripsi" :value="__('Deskripsi')" />
                <x-input type="text" name="deskripsi" id="deskripsi" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('deskripsi')" placeholder="Masukkan Deskripsi Fasilitas" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="foto_fasilitas" :value="__('Foto Fasilitas')" class="mb-1" />
                <x-input type="file" name="foto_fasilitas" id="foto_fasilitas" class="file:!ml-0 file:!py-2 file:!px-4 file:rounded-lg file:!bg-dashboard/10 file:!text-dashboard hover:file:!bg-dashboard/20 active:file:!bg-dashboard/30 block w-full text-primary/80" :value="old('foto_fasilitas')" placeholder="Masukkan Foto Fasilitas" />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>