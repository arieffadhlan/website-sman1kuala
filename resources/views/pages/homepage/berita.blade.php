<x-guest-layout>
    <x-container>
        <div class="pt-[180px] pb-12 sm:pb-[60px]">
            <div class="flex justify-center">
                <div class="mb-3 sm:w-full md:w-[600px] lg:w-[640px] xl:w-[720px]">
                    <div class="input-group flex relative mb-4 w-full h-12">
                        <input type="text" class="form-control block flex-auto relative px-3 py-1.5 m-0 min-w-0 w-full border border-solid rounded-tl-lg rounded-bl-lg bg-clip-padding text-base font-normal border-gray-300 bg-white text-primary transition ease-in-out focus:ring-0 focus:!border-secondary focus:bg-white focus:outline-none" placeholder="Cari berita ..." aria-label="Search" aria-describedby="newsSearchButton">
                        <button class="btn flex items-center px-6 py-2.5 rounded-tr-lg rounded-br-lg text-xs leading-tight uppercase font-medium shadow-md transition duration-150 ease-in-out bg-secondary text-white hover:bg-[#49a162] active:bg-[#397d4c]" type="button" id="newsSearchButton">
                            <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" class="w-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
            <div class="pt-12 sm:pt-[60px]">
                <div class="no-scrollbar container flex flex-nowrap justify-start items-center gap-7 mx-auto px-0.5 py-5 overflow-auto scroll-px-0.5 snap-x snap-mandatory lg:flex-wrap xl:flex-nowrap lg:justify-center lg:px-0 lg:snap-none">
                    <x-homepage.news-card></x-homepage.news-card>
                    <x-homepage.news-card></x-homepage.news-card>
                    <x-homepage.news-card></x-homepage.news-card>
                </div>
            </div>
        </div>
    </x-container>
</x-guest-layout>