<x-app-layout>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Edit Data Kelas</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Kelas</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('kelas.update', $class['0']->id) }}">
            @csrf
            @method('put')
            <div>
                <x-label for="nama" value="Nama" />
                <x-input type="text" name="nama" id="nama" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama', $class['0']->nama)" placeholder="Masukkan nama kelas" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="wali_kelas" value="Wali Kelas" />
                <select name="wali_kelas" id="wali_kelas" class="mt-1 w-full h-10 rounded-lg shadow-sm transition duration-[0.2s] ease-[cubic-bezier(.4,0,1,1)] border-gray-300 focus:border-secondary focus:ring focus:ring-secondary focus:ring-opacity-20">
                    <option disabled class="bg-gray-200 text-gray-400">Pilih wali kelas</option>
                    @if ($teachers->isNotEmpty())
                        @foreach ($teachers as $teacher)
                            <option value="{{ $teacher->nip }}"
                                {{ old('wali_kelas', $class['0']->wali_kelas) == $teacher->nip ? 'selected' : '' }}>
                                {{ $teacher->nama_guru }}
                            </option>
                        @endforeach
                    @endif
                </select>
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>