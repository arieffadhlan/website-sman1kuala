<x-guest-layout>
    <x-container>
        <div class="flex flex-col gap-y-9 mt-[114px]">
            <img src="{{ asset('storage/images/berita/' . $newsPost->foto) }}" class="w-full h-[20rem] rounded-xl bg-gray-400 sm:h-[27.5rem] brightness-75" alt="{{ $newsPost->foto }}">
            <h1 class="mb-9 pb-4 border-b border-neutral border-opacity-20 text-3xl leading-[42px] traking-[-0.021em] font-bold text-primary sm:text-4xl sm:leading-[48px]">{{ $newsPost->judul }}</h1>
        </div>
        <div class="flex flex-col gap-y-5 w-full text-justify">
            <p class="text-base tracking-[-0.011em] font-normal text-primary sm:text-lg sm:tracking-[-0.014em]">
                {!! $newsPost->deskripsi !!}
            </p>
        </div>
    </x-container>
</x-guest-layout>