<x-guest-layout>
    @push('guest-styles')
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    @endpush
    @push('guest-head-script')
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    @endpush

    <img src="{{ asset('images/hero-homepage.png') }}" class="w-full" alt="SMAN 1 Kuala">
    <x-container>
        <div class="pt-20 pb-12 sm:pt-[100px] sm:pb-[60px]">
            <div class="flex flex-wrap items-center justify-center gap-8">
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-6xl leading-[80px] tracking-[-0.022em] font-bold text-secondary">40</h1>
                    <h2 class="text-xl tracking-[-0.017em] font-bold text-primary">Guru</h2>
                </div>
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-6xl leading-[80px] tracking-[-0.022em] font-bold text-secondary">15.000</h1>
                    <h2 class="text-xl tracking-[-0.017em] font-bold text-primary">Peserta Didik</h2>
                </div>
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-6xl leading-[80px] tracking-[-0.022em] font-bold text-secondary">30</h1>
                    <h2 class="text-xl tracking-[-0.017em] font-bold text-primary">Mata Pelajaran</h2>
                </div>
            </div>
        </div>
        <div class="pt-12 pb-10 sm:pt-[60px]">
            <h1 class="relative mb-11 text-center text-3xl tracking-[-0.021em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2">Berita Terbaru</h1>
            <div class="no-scrollbar container flex flex-nowrap justify-start items-center gap-7 mx-auto px-0.5 py-5 overflow-auto snap-x lg:flex-wrap xl:flex-nowrap lg:justify-center lg:px-0 lg:snap-none">
                <x-homepage.news-card></x-homepage.news-card>
                <x-homepage.news-card></x-homepage.news-card>
                <x-homepage.news-card></x-homepage.news-card>
            </div>
        </div>
    </x-container>
    <div class="flex flex-col items-center justify-center my-12 py-[60px] bg-[#DCF0E2]">
        <h1 class="relative mb-11 text-center text-3xl tracking-[-0.021em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2">Ekstrakurikuler</h1>
        <div class="grid grid-cols-1 gap-5 place-items-center xs:grid-rows-4 xs:grid-cols-2 sm:grid-rows-4 sm:grid-cols-2 md:grid-rows-3 md:grid-cols-3 lg:grid-rows-2 lg:grid-cols-4">
            <x-homepage.extracurricular-card></x-homepage.extracurricular-card>
        </div>
    </div>
    <x-container>
        <div class="flex flex-col items-center justify-center pt-12 sm:py-[60px]">
            <h1 class="relative mb-11 text-center text-3xl tracking-[-0.021em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2">Denah Lokasi</h1>
            <div class="container w-full h-[25rem]" id="map"></div>
        </div>
    </x-container>

    @push('guest-script')
        <script>
            let map = L.map('map').setView([3.5237689647852695, 98.39105149977733], 15);
            L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                maxZoom: 18,
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' + 'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                id: 'mapbox/streets-v11',
                tileSize: 512,
                zoomOffset: -1
            }).addTo(map);

            L.marker([3.5237689647852695, 98.39105149977733]).addTo(map)
        </script>
    @endpush
</x-guest-layout>