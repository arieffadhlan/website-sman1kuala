<nav class="sticky top-0 px-2 sm:px-20 py-5 z-10 shadow-md bg-white">
    <div class="container flex flex-wrap justify-between items-center mx-auto">
        <a href="{{ route('beranda') }}" class="flex items-center">
            {{-- <img src="/docs/images/logo.svg" class="h-6 mr-3 sm:h-9" alt="Logo SMAN 1 Kuala"> --}}
            <span class="self-center font-semibold text-2xl text-primary whitespace-nowrap">SMAN 1 Kuala</span>
        </a>
        <button data-collapse-toggle="mobile-menu" type="button"
            class="inline-flex items-center p-2 ml-3 text-sm text-primary rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
            aria-controls="mobile-menu" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" aclip-rule="evenodd"></path>
            </svg>
            <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
            </svg>
        </button>
        <div class="hidden w-full md:block md:w-auto" id="mobile-menu">
            <ul class="flex flex-col justify-center items-center md:flex-row mt-4 md:mt-0 md:space-x-10 md:font-semibold text-base leading-[22px]">
                @foreach ($navbar as $name => $url)
                    @if ($name == "Beranda")
                        <li>
                            <x-nav-link :href="$url" :active="request()->routeIs('beranda')" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @else
                        <li>
                            <x-nav-link :href="$url" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @endif
                @endforeach
                <li>
                    <a href="{{ route('login') }}" class="inline-flex items-center px-5 py-2 bg-secondary border border-transparent rounded-lg font-semibold text-base leading-[22px] tracking-[-1.1%] text-white hover:bg-[#49a162] active:bg-[#397d4c] disabled:opacity-25 transition duration-300 ease-in-out">
                        Masuk
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
