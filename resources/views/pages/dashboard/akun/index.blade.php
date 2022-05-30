<x-app-layout>
    <x-alert></x-alert>
    <h1 class="mb-7 font-semibold text-2xl text-primary">Data Akun Saya</h1>
    <x-dashboard.form-card>
        <x-slot:cardTitle>Ubah Data Akun Saya</x-slot:cardTitle>
        <form method="POST" action="{{ route('akun-saya.update') }}" enctype="multipart/form-data">
            @csrf
            @method('put')
            <div class="flex flex-col justify-center items-center w-fit gap-y-4">
                @if (Auth::user()->foto != 'user.png')
                    <img src="{{ asset('storage/images/akun/' . Auth::user()->foto) }}" class="w-[100px] h-[100px] align-middle border-none rounded-full shadow-lg" alt="{{ Auth::user()->foto }}" />
                @else
                    <img src="{{ asset('images/dashboard/user.png') }}" class="w-[100px] h-[100px] align-middle border-none rounded-full shadow-lg" alt="{{ Auth::user()->foto }}" />
                @endif
                <button type="button" class="openModal inline-flex justify-center px-4 py-1.5 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-slate-600 font-semibold text-white transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-slate-500 hover:bg-slate-700 active:bg-slate-800 disabled:opacity-25">
                    Ubah Foto
                </button>
            </div>
            <x-modal id="modal" route="{{ route('akun-saya.update') }}">
                <x-slot:modalTitle>Ubah Foto Profil</x-slot:modalTitle>
                <div class="mb-2 text-sm text-gray-500/80"><i>Upload</i> foto baru Anda. Foto disarankan berukuran tidak lebih dari 2mb.</div>
                <div class="mt-4">
                <x-input type="file" name="foto" id="foto" class="file:!ml-0 file:!py-2 file:!px-4 file:rounded-lg file:!bg-dashboard/10 file:!text-dashboard hover:file:!bg-dashboard/20 active:file:!bg-dashboard/30 block w-full text-primary/80" :value="old('foto')" />
                @error('image')
                    <div class="text-sm text-red-600 mt-2">{{ $message }}</div>
                @enderror
                </div>
            </x-modal>
        </form>
        <form method="POST" action="{{ route('akun-saya.update') }}">
            @csrf
            @method('put')
            <div class="mt-5">
                <x-label for="nama" :value="__('Nama')" />
                <x-input type="text" name="nama" id="nama" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('nama', $account['0']->nama)" placeholder="Masukkan nama" />
                @error('nama')
                    <div class="text-sm text-red-600 mt-2">{{ $message }}</div>
                @enderror
            </div>
            <div class="mt-5 mb-7">
                <x-label for="email" :value="__('Email')" />
                <x-input type="email" name="email" id="email" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('email', $account['0']->email)" placeholder="Masukkan email" />
                @error('email')
                    <div class="text-sm text-red-600 mt-2">{{ $message }}</div>
                @enderror
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>

    <x-dashboard.form-card>
        <x-slot:cardTitle>Ubah Kata Sandi</x-slot:cardTitle>
        <form method="POST" action="{{ route('akun-saya.update') }}">
            @csrf
            @method('put')
            <div class="mt-5 mb-7">
                <x-label for="password" value="Kata Sandi Baru" />
                <x-input type="password" name="password" id="password" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('password')" placeholder="Masukkan kata sandi" />
                @error('password')
                    <div class="text-sm text-red-600 mt-2">{{ $message }}</div>
                @enderror
                <div class="mt-2 text-sm text-gray-500/80">Gunakan minimal 8 karakter dengan kombinasi huruf dan angka.</div>
            </div>
            <div class="mt-5 mb-7">
                <x-label for="password_confirmation" value="Konfirmasi Kata Sandi" />
                <x-input type="password" name="password_confirmation" id="password_confirmation" class="placeholder:!font-normal placeholder:text-[#252f3f66] block mt-1 w-full" :value="old('password_confirmation')" placeholder="Masukkan ulang kata sandi" />
            </div>
            <button type="submit" class="inline-block px-5 py-2 w-full h-11 border border-transparent rounded-lg text-center text-base tracking-[-0.011em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Kirim
            </button>
        </form>
    </x-dashboard.form-card>
</x-app-layout>