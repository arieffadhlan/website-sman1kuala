<x-app-layout>    
    <h1 class="mb-7 font-semibold text-2xl text-primary">Edit Data Bidang Studi</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Bidang Studi</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('bidang-studi.update', $fieldOfStudy['0']->id) }}">
            @csrf
            @method('put')
            <div class="mb-7">
                <x-label for="nama_bidangStudi" value="Nama Bidang Studi" />
                <x-input type="text" name="nama_bidangStudi" id="nama_bidangStudi" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_bidangStudi', $fieldOfStudy['0']->nama_bidangStudi)" placeholder="Masukkan nama bidang studi" autofocus />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>