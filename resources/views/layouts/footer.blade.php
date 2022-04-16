<div class="mt-[120px] px-16 py-20 w-full bg-[#DCF0E2]">
    <divm class="container flex mx-auto gap-x-36">
        <div class="flex flex-col max-w-xs gap-y-3">
            <h1 class="text-2xl tracking-[-0.019em] font-bold text-primary">SMAN 1 Kuala</h1>
            <div class="flex flex-col gap-y-1">
                <h2 class="text-sm tracking-[-0.006em] font-normal  text-primary">
                    <span class="font-semibold">Alamat:</span> Jl. Perintis Kemerdekaan No.3 Kuala, Kab. Langkat, Sumatera Utara.
                </h2>
                <h2 class="text-sm tracking-[-0.006em] font-normal  text-primary">
                    <span class="font-semibold">Telepon:</span> 0123456789
                </h2>
                <h2 class="text-sm tracking-[-0.006em] font-normal  text-primary">
                    <span class="font-semibold">Email:</span> info@sman1kuala.sch.id
                </h2>
            </div>
        </div>
        <div>
            <div class="flex flex-col gap-y-4">
                <h1 class="text-xl tracking-[-0.017em] font-bold text-primary">Navigasi</h1>
                <div class="flex flex-col items-start gap-y-4">
                    @foreach ($footerLinks as $footerLink => $url)
                        @if ($footerLink == "Beranda")
                            <x-nav-link :href="$url" :active="request()->routeIs('beranda')" aria-current="page">
                                {{ $footerLink }}
                            </x-nav-link>
                        @else
                            <x-nav-link :href="$url" aria-current="page">
                                {{ $footerLink }}
                            </x-nav-link>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </divm>
</div>