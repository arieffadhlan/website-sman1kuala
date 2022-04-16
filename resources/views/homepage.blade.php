<x-guest-layout>
    @push('guest-styles')
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    @endpush
    @push('guest-head-script')
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    @endpush

    <x-navbar></x-navbar>
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
    <x-container>
        <div class="flex flex-col justify-center items-center py-[60px]">
            <h1 class="mb-[64px] relative text-center font-bold text-3xl tracking-[-0.021em] text-primary after:content-[' '] after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:absolute after:bg-secondary after:-translate-x-1/2">Denah Lokasi</h1>
            <div class="h-[25rem] w-full" id="map"></div>
        </div>
    </x-container>
    <x-footer></x-footer>

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