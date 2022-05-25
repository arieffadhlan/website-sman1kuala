{{-- Sidebar --}}
<nav class="relative z-10 flex flex-wrap items-center justify-between px-6 py-2 border-b border-gray-300 bg-dashboard md:flex-row md:flex-nowrap md:block md:fixed md:top-0 md:bottom-0 md:left-0 md:w-64 md:overflow-hidden md:overflow-y-scroll md:border-r">
    <div class="flex flex-wrap items-center justify-between w-full px-0 mx-auto md:flex-col md:items-stretch md:min-h-full md:flex-nowrap">
        <button
            class="px-3 py-1 text-xl leading-none text-white bg-transparent border border-transparent border-solid rounded opacity-50 cursor-pointer md:hidden"
            type="button" 
			onclick="toggleNavbar('collapse-sidebar')"
		>
            <i class="fas fa-bars"></i>
        </button>
        <h1 class="inline-block p-4 px-0 mr-0 text-2xl font-bold text-left uppercase md:block md:pb-2 text-white whitespace-nowrap">
            Dashboard
        </h1>
        <ul class="flex flex-wrap items-center list-none md:hidden">
            <li class="relative inline-block">
                <a href="#pablo" class="block text-white" onclick="openDropdown(event,'user-responsive-dropdown')">
                    <div class="flex items-center">
                        <span class="inline-flex items-center justify-center w-12 h-12 text-sm text-white rounded-full bg-white">
							<img src="{{ asset('images/dashboard/admin.jpg') }}" class="w-full align-middle border-none rounded-full shadow-lg" alt="..." />
						</span>
                    </div>
                </a>
            </li>
        </ul>

		{{-- Sidebar Contents --}}
        <div class="absolute top-0 left-0 right-0 z-40 items-center flex-1 hidden h-auto rounded shadow md:flex md:flex-col md:items-stretch md:relative md:shadow-none" id="collapse-sidebar">
            <div class="block pb-4 md:mb-4 md:min-w-full md:hidden">
                <div class="flex flex-wrap">
                    {{-- Responsive Sidebar Header --}}
                    <div class="w-6/12">
                        @foreach ($masterDataLinks as $linkName => $url)
                            @if (request()->route()->getName() == strtolower($linkName))                  
                                <h1 class="inline-block p-4 px-0 mr-0 text-xl font-bold text-left md:block md:pb-2 text-primary whitespace-nowrap md:text-white">{{ $linkName }}</h1>
                                @break
                            @endif
                        @endforeach
                    </div>
                    <div class="flex justify-end w-6/12">
                        <button 
							type="button"
                            class="px-3 py-1 text-xl leading-none text-black bg-transparent border border-transparent border-solid rounded opacity-50 cursor-pointer md:hidden"
                            onclick="toggleNavbar('collapse-sidebar')"
						>
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>

            {{-- Sidebar Links --}}
            <div class="md:my-4 md:min-w-full md:bg-gray-100/20 md:h-[1px]"></div>
            <hr class="mt-0 mb-4 min-w-full md:hidden" />
            <h6 class="block pt-1 pb-2 text-xs font-semibold no-underline uppercase md:min-w-full text-primary/30 md:text-white/30">
                # Data Master
            </h6>
            <ul class="flex flex-col list-none md:flex-col md:min-w-full">
                @foreach ($masterDataLinks as $linkName => $url)
                    @foreach ($masterDataIcons as $linkNameWithIcon => $icon)
                        @if ($linkName == $linkNameWithIcon)
                            <li class="items-center">
                                <x-sidebar-link :href="$url" :active="request()->routeIs(strtolower($linkName))" :icon="$icon">
                                    {{ $linkName }}
                                </x-sidebar-link>
                            </li>
                            @break 
                        @endif
                    @endforeach
                @endforeach
            </ul>

            <div class="md:my-4 md:min-w-full md:bg-gray-100/20 md:h-[1px]"></div>
            <hr class="my-4 min-w-full md:hidden" />
            <h6 class="block pt-1 pb-2 text-xs font-semibold no-underline uppercase md:min-w-full text-primary/30 md:text-white/30">
                # Akun
            </h6>
            <ul class="flex flex-col list-none md:flex-col md:min-w-full md:mb-4">
                @foreach ($accountDataLinks as $linkName => $url)
                    @foreach ($accountDataIcons as $linkNameWithIcon => $icon)
                        @if ($linkName == $linkNameWithIcon)
                            <li class="items-center">
                                <x-sidebar-link :href="$url" :active="request()->routeIs(strtolower($linkName))" :icon="$icon">
                                    {{ $linkName }}
                                </x-sidebar-link>
                            </li>
                            @break 
                        @endif
                    @endforeach
                @endforeach
                <li class="items-center">
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <a 
                            href="{{ route('logout') }}"
                            onclick="event.preventDefault(); this.closest('form').submit();" 
                            class="block py-3 text-sm font-medium text-primary/70 md:text-white/70"
                        >
                            <div class="inline-block mr-1"><i class="block mr-2 text-sm fa-fw fas fa-sign-out-alt text-primary/70 md:text-white/70"></i></div>
                            Keluar
                        </a>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

{{-- Sidebar Header --}}
<div class="relative md:ml-64">
    <nav class="relative top-0 left-0 z-10 flex items-center w-full p-4 md:flex-row md:flex-nowrap md:justify-start md:bg-white md:border-b md:border-gray-300">
        <div class="flex flex-wrap items-center justify-between w-full px-4 mx-auto md:flex-nowrap md:px-10">
            @foreach ($masterDataLinks as $linkName => $url)
                @if (request()->route()->getName() == strtolower($linkName))                  
                    <h1 class="hidden text-xl font-semibold text-primary md:inline-block">{{ $linkName }}</h1>
                    @break
                @endif
            @endforeach
            <ul class="flex-col items-center hidden list-none md:flex-row md:flex">
                <a class="block text-white" href="#pablo" onclick="openDropdown(event,'user-dropdown')">
                    <div class="flex items-center">
                        <span class="inline-flex items-center justify-center w-12 h-12 text-sm text-white rounded-full bg-white">
							<img src="{{ asset('images/dashboard/admin.jpg') }}" class="w-full align-middle border-none rounded-full shadow-lg" alt="..." />
						</span>
                    </div>
                </a>
            </ul>
        </div>
    </nav>
