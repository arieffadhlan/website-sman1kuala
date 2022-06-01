<x-app-layout>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Tambah Data Pegawai</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Tambah Data Pegawai</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('pegawai.store') }}">
            @csrf
            <div>
                <x-label for="nama_pegawai" :value="__('Nama Fasilitas')" />
                <x-input type="text" name="nama_pegawai" id="nama_pegawai" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_pegawai')" placeholder="Masukkan Nama Pegawai" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="ket_pegawai" :value="__('Keterangan Pegawai')" />
                <x-input type="text" name="ket_pegawai" id="ket_pegawai" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('ket_pegawai')" placeholder="Masukkan Keterangan Pegawai" autofocus />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>