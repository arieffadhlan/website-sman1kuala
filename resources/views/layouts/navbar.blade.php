<nav class="sticky top-0 px-8 sm:px-16 py-5 z-[2000] shadow-md bg-white">
    <div class="container flex flex-wrap justify-between items-center mx-auto">
        <a href="{{ route('beranda') }}" class="flex items-center">
            {{-- <img src="/docs/images/logo.svg" class="h-6 mr-3 sm:h-9" alt="Logo SMAN 1 Kuala"> --}}
            <span class="self-center font-semibold text-2xl text-primary whitespace-nowrap">SMAN 1 Kuala</span>
        </a>
        <div class="flex md:order-2">
            <a href="{{ route('login') }}" class="block lg:inline-flex lg:items-center px-5 py-2 bg-secondary border border-transparent rounded-lg font-semibold text-center text-sm tracking-[-0.006em] text-white hover:bg-[#49a162] active:bg-[#397d4c] disabled:opacity-25 transition duration-300 ease-in-out">
                Masuk
            </a>
            <button data-collapse-toggle="mobile-menu" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="mobile-menu"  aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
                </svg>
                <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                </svg>
            </button>
        </div>
        <div class="hidden w-full lg:block lg:w-auto lg:order-1" id="mobile-menu">
            <ul class="flex flex-col lg:flex-row lg:items-center mt-4 lg:mt-0 lg:space-x-8 space-y-1 lg:space-y-0">
                @foreach ($navbar as $name => $url)
                    @if ($name == "Beranda")
                        <li>
                            <x-nav-link :href="$url" :active="request()->routeIs('beranda')" class="block px-5 py-2 lg:p-0 lg:text-primary bg-[#DCF0E2] lg:bg-transparent lg:hover:bg-transparent rounded-lg transition duration-300 ease-in-out" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @else
                        <li>
                            <x-nav-link :href="$url" class="block px-5 py-2 lg:p-0 lg:text-primary lg:bg-transparent hover:bg-[#DCF0E2] lg:hover:bg-transparent rounded-lg transition duration-300 ease-in-out" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>
    </div>
</nav>


@push('guest-head-script')
    <script src="https://unpkg.com/flowbite@1.4.2/dist/flowbite.js"></script>
@endpush
