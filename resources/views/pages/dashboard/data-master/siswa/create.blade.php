<x-app-layout>
    <h1 class="mb-7 font-medium text-lg text-primary">Tambah Data Siswa</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Tambah Data Siswa</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('siswa.store') }}">
            @csrf
            <div>
                <x-label for="nis" value="NIS" />
                <x-input type="number" name="nis" id="nis" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nis')" placeholder="Masukkan NIS siswa" autofocus />
            </div>
            <div class="mt-5">
                <x-label for="nisn" value="NISN" />
                <x-input type="number" name="nisn" id="nisn" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nisn')" placeholder="Masukkan NISN siswa" />
            </div>
            <div class="mt-5">
                <x-label for="nama_siswa" value="Nama Siswa" />
                <x-input type="text" name="nama_siswa" id="nama_siswa" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_siswa')" placeholder="Masukkan nama siswa" />
            </div>
            <div class="mt-5">
                <x-label for="jk_siswa" value="Jenis Kelamin" />
                <select name="jk_siswa" id="jk_siswa" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option selected disabled class="bg-gray-200 text-gray-400">Pilih Jenis Kelamin Siswa</option>
                    <option value="L">Laki-Laki</option>
                    <option value="P">Perempuan</option>
                </select>
            </div>
            <div class="mt-5">
                <x-label for="agama_siswa" value="Agama Siswa" />
                <select name="agama_siswa" id="agama_siswa" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option selected disabled class="bg-gray-200 text-gray-400">Pilih Agama Siswa</option>
                    <option value="Islam">Islam</option>
                    <option value="Kristen">Kristen</option>
                    <option value="Hindu">Hindu</option>
                    <option value="Buddha">Buddha</option>
                </select>
            </div>
            <div class="mt-5">
                <x-label for="id_kelas" value="Kelas" />
                <select name="id_kelas" id="id_kelas" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option selected disabled class="bg-gray-200 text-gray-400">Pilih Kelas</option>
                    @if ($classes->isNotEmpty())
                        @foreach ($classes as $class)
                            <option value="{{ $class->id }}"
                                {{ old('id_kelas') == $class->id ? 'selected' : '' }}>
                                {{ $class->nama }}
                            </option>
                        @endforeach
                    @endif
                </select>
            </div>
            <div class="mt-5 mb-7">
                <x-label for="ket_siswa" value="Keterangan Siswa" />
                <select name="ket_siswa" id="ket_siswa" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option selected disabled class="bg-gray-200 text-gray-400">Pilih Keterangan Siswa</option>
                    <option value="Aktif">Aktif</option>
                    <option value="Tidak Aktif">Tidak Aktif</option>
                    <option value="Mengundurkan Diri">Mengundurkan Diri</option>
                    <option value="Pindah">Pindah</option>
                    <option value="Dikeluarkan">Dikeluarkan</option>
                </select>
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>