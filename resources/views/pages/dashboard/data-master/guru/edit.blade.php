<x-app-layout>
    <h1 class="mb-7 font-medium text-lg text-primary">Edit Data Guru</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Guru</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('guru.update', $teacher->NIP) }}">
            @csrf
            @method('put')
            <div>
                <x-label for="nip" :value="__('NIP')" />
                <x-input type="text" name="nip" id="nip" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nip', $teacher->NIP)" placeholder="Masukkan NIP" autofocus />
            </div>
            <div class="mt-5">
                <x-label for="nama_guru" :value="__('Nama Guru')" />
                <x-input type="text" name="nama_guru" id="nama_guru" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_guru', $teacher->nama_guru)" placeholder="Masukkan nama guru" autofocus />
            </div>
            <div class="mt-5">
                <x-label for="bidang_studi" :value="__('Bidang Studi')" />
                <select name="bidang_studi" id="bidang_studi" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option selected disabled class="bg-gray-200 text-gray-400">Pilih bidang studi</option>
                    @if ($fieldsOfStudy->isNotEmpty())
                        @foreach ($fieldsOfStudy as $fieldOfStudy)
                            <option value="{{ $fieldOfStudy->id }}"
                                {{ old('bidang_studi', $teacher->id_bidangStudi) == $fieldOfStudy->id ? 'selected' : '' }}>
                                {{ $fieldOfStudy->nama_bidangStudi }}
                            </option>
                        @endforeach
                    @endif
                </select>
            </div>
            <div class="mt-5">
                <x-label for="golongan_guru" :value="__('Golongan Guru')" />
                <x-input type="text" name="golongan_guru" id="golongan_guru" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('golongan_guru', $teacher->gol_guru)" placeholder="Masukkan golongan guru" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="keterangan_guru" :value="__('Keterangan Guru')" />
                <x-input type="text" name="keterangan_guru" id="keterangan_guru" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('keterangan_guru', $teacher->ket_guru)" placeholder="Masukkan keterangan" autofocus />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>