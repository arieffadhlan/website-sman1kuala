@push('guest-script')
    <script src="https://unpkg.com/flowbite@1.4.2/dist/flowbite.js"></script>
@endpush

<nav class="fixed top-0 px-8 py-5 w-full z-[2000] shadow-md bg-white sm:px-16">
    <div class="container flex flex-wrap items-center justify-between mx-auto lg:flex-nowrap">
        <a href="{{ route('beranda') }}" class="flex items-center">
            {{-- <img src="/docs/images/logo.svg" class="h-6 mr-3 sm:h-9" alt="Logo SMAN 1 Kuala"> --}}
            <span class="self-center text-xl font-semibold text-primary whitespace-nowrap xs:text-2xl">SMAN 9 Medan</span>
        </a>
        <div class="flex">
            <button data-collapse-toggle="mobile-menu" type="button" class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 lg:hidden" aria-controls="mobile-menu"  aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
                </svg>
                <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                </svg>
            </button>
        </div>
        <div class="hidden w-full lg:block lg:w-auto" id="mobile-menu">
            <ul class="flex flex-col mt-4 space-y-1 lg:flex-row lg:items-center lg:space-x-8 lg:space-y-0 lg:mt-0">
                @foreach ($navLinks as $name => $url)
                    @if ($name == "Beranda")
                        <li>
                            <x-nav-link :href="$url" :active="request()->routeIs('beranda')" class="block px-5 py-2 rounded-lg bg-gray-200 transition duration-300 ease-in-out lg:p-0 lg:bg-transparent lg:hover:bg-transparent lg:text-primary" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @elseif (in_array($name, ["Profil", "Akademik"]))
                        <li>
                            <button id="dropdownNavbarLink" data-dropdown-toggle="{{ strtolower($name) . "Dropdown" }}" class="flex items-center justify-between px-5 py-2 w-full rounded-lg text-sm tracking-[-0.006em] font-normal hover:bg-gray-100 lg:hover:bg-transparent lg:p-0 lg:w-auto lg:border-0">
                                {{ $name }} 
                                <svg class="ml-0.5 w-4 h-4" fill="#252F3F" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                            </button>
                            <div>
                                <ul>
                                    <li id="{{ strtolower($name) . "Dropdown" }}" class="!static hidden py-1 lgMax:!transform-none lg:!absolute lg:!mt-[18px] lg:rounded lg:divide-y lg:divide-gray-100 lg:bg-white lg:shadow">
                                        @if ($name == "Profil")
                                            <x-nav-link :href="route('sambutan-kepala-sekolah')" :active="request()->routeIs('sambutan-kepala-sekolah')" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Sambutan Kepala Sekolah</x-nav-link>
                                            <x-nav-link :href="route('sejarah')" :active="request()->routeIs('sejarah')" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Sejarah</x-nav-link>
                                            <x-nav-link :href="route('visi-misi')" :active="request()->routeIs('visi-misi')" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Visi & Misi</x-nav-link>
                                            <x-nav-link href="#" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Sarana Prasarana</x-nav-link>
                                            <x-nav-link href="#" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Struktur Organisasi</x-nav-link>
                                        @elseif ($name == "Akademik")
                                            <x-nav-link href="#" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Kalender</x-nav-link>
                                            <x-nav-link href="#" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Tata Tertib</x-nav-link>
                                            <x-nav-link href="#" class="block py-2 px-10 text-primary rounded-lg hover:bg-gray-100 lg:rounded-none">Prestasi</x-nav-link>
                                        @endif
                                    </li>
                                </ul>
                            </div>
                        </li>
                    @else
                        <li>
                            <x-nav-link :href="$url" class="block px-5 py-2 lg:p-0 rounded-lg transition duration-300 ease-in-out hover:bg-gray-100 lg:bg-transparent lg:text-primary lg:hover:bg-transparent" aria-current="page">
                                {{ $name }}
                            </x-nav-link>
                        </li>
                    @endif
                @endforeach
                <a href="{{ route('login') }}" class="block px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-secondary font-semibold text-white transition duration-250 ease-in-out hover:ring-2 hover:ring-offset-2 hover:ring-secondary hover:bg-[#49a162] active:bg-[#397d4c] disabled:opacity-25 lg:inline-flex lg:items-center">
                    Masuk
                </a>
            </ul>
        </div>
    </div>
</nav>
