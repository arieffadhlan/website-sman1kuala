<x-guest-layout>
    <x-navbar />
    <img src="{{ asset('images/hero-homepage.png') }}" class="w-full" alt="SMAN 1 Kuala">
    <x-container>
        <div class="flex justify-center items-center gap-x-7 py-[60px]">
            <x-news-card></x-news-card>
            <x-news-card></x-news-card>
            <x-news-card></x-news-card>
        </div>
    </x-container>
    <div class="flex flex-col justify-center items-center my-[60px] py-[60px] bg-[#DCF0E2]">
        <h1 class="mb-[64px] relative text-center font-bold text-3xl tracking-[-0.021em] text-primary after:content-[' '] after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:absolute after:bg-secondary after:-translate-x-1/2">Ekstrakulikuler</h1>
        <div class="grid grid-rows-2 grid-cols-4 place-items-center gap-7">
            <x-ekstrakulikuler-card></x-ekstrakulikuler-card>
        </div>
    </div>
</x-guest-layout>