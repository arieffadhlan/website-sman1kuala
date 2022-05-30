<x-app-layout>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Edit Data Akun</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Form Edit Data Akun</x-slot:cardTitle>
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('akun.update', $account['0']->id) }}">
            @csrf
            @method('put')
            <div>
                <x-label for="nama" :value="__('Nama')" />
                <x-input type="text" name="nama" id="nama" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama', $account['0']->nama)" placeholder="Masukkan nama" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="email" :value="__('Email')" />
                <x-input type="email" name="email" id="email" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('email', $account['0']->email)" placeholder="Masukkan email" />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="password" :value="__('Password')" />
                <x-input type="password" name="password" id="password" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('password')" placeholder="Masukkan password" />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="password_confirmation" :value="__('Konfirmasi Password')" />
                <x-input type="password" name="password_confirmation" id="password_confirmation" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('password_confirmation')" placeholder="Masukkan ulang password" />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>