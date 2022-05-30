<x-app-layout>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Edit Data Ekstrakurikuler</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Ekstrakurikuler</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('ekstrakurikuler.update', $extracurricular['0']->id) }}">
            @csrf
            @method('put')
            <div>
                <x-label for="nama_ekstrakurikuler" :value="__('Nama')" />
                <x-input type="text" name="nama_ekstrakurikuler" id="nama_ekstrakurikuler" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama_ekstrakurikuler', $extracurricular['0']->nama_ekstrakurikuler)" placeholder="Masukkan nama ekstrakurikuler" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="ikon" :value="__('Ikon')" class="mb-1" />
                <x-input type="file" name="ikon" id="ikon" class="file:!ml-0 file:!py-2 file:!px-4 file:rounded-lg file:!bg-dashboard/10 file:!text-dashboard hover:file:!bg-dashboard/20 active:file:!bg-dashboard/30 block w-full text-primary/80" :value="old('ikon', $extracurricular['0']->ikon)" placeholder="Masukkan ikon Ekstrakurikuler" />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>