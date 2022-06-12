<x-guest-layout>
    <x-container>
        <div class="flex flex-col gap-y-9 mt-[114px]">
            <div class="relative flex justify-end items-end rounded-xl h-[20rem] sm:h-[27.5rem]">
                <img class="absolute w-full h-[20rem] object-content !rounded-xl brightness-75 sm:h-[27.5rem]" src="{{ asset('storage/images/berita/' . $newsPost->foto) }}" alt="{{ $newsPost->foto }}">
                <div class="relative mb-4 mr-4 p-4 rounded-xl bg-primary">
                    <span class="text-base font-normal text-white">{{ $newsPost->created_at }}</span>
                </div>
            </div>
            <div class="flex flex-col gap-y-5">
                <h1 class="text-2xl leading-[34px] traking-[-0.019em] font-bold text-primary sm:text-3xl sm:leading-[42px] sm:traking-[-0.021em]">{{ $newsPost->judul }}</h1>
                <div class="flex items-center w-full gap-x-2 mb-9 pb-4 border-b border-neutral border-opacity-20 ">
                    <img class="w-8 h-8 rounded-full" src="{{ asset('storage/images/akun/' . $newsPost->foto_pembuat) }}" alt="{{ $newsPost->pembuat_berita }}">
                    <span class="text-base font-semibold text-[#595959]">{{ $newsPost->nama_pembuat }}</span>
                </div>
            </div>
        </div>
        <div class="flex flex-col gap-y-5 w-full text-justify">
            <h2 class="text-base tracking-[-0.011em] font-normal text-primary sm:text-lg sm:tracking-[-0.014em]">
                {!! $newsPost->deskripsi !!}
            </h2>
        </div>
    </x-container>
</x-guest-layout>