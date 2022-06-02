<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="{{ route('beranda') }}" class="flex items-center">
                <span class="self-center text-2xl font-semibold text-primary whitespace-nowrap xs:text-3xl">SMAN 9 Medan</span>
            </a>
        </x-slot>
        <h1 class="mb-6 font-semibold text-xl tracking-[-0.017em] text-primary">Masuk ke Akun Anda</h1>
        <x-auth-session-status class="mb-4" :status="session('status')" />
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div>
                <x-label for="nama" value="Nama" />
                <x-input type="text" name="nama" id="nama" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama')" placeholder="Masukkan nama Anda" autofocus />
            </div>
            <div class="mt-5 mb-7">
                <x-label for="password" value="Password" />
                <x-input type="password" name="password" id="password" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" placeholder="Masukkan password Anda" autocomplete="current-password" />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-secondary font-semibold text-white transition duration-250 ease-in-out hover:bg-[#49a162] active:bg-[#397d4c] disabled:opacity-25">
                Masuk
            </button>
        </form>
    </x-auth-card>
</x-guest-layout>
