<x-guest-layout>
    @push('guest-styles')
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.min.css" integrity="sha512-1xoFisiGdy9nvho8EgXuXvnpR5GAMSjFwp40gSRE3NwdUdIMIKuPa7bqoUhLD0O/5tPNhteAsE5XyyMi5reQVA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    @endpush
    @push('guest-head-script')
        <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.min.js" integrity="sha512-SeiQaaDh73yrb56sTW/RgVdi/mMqNeM2oBwubFHagc5BkixSpP1fvqF47mKzPGWYSSy4RwbBunrJBQ4Co8fRWA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    @endpush

    <img src="{{ asset('images/hero-homepage.jpeg') }}" class="pt-[72px] w-full h-[540px]" alt="SMAN 9 Medan">
    <x-container>
        <div class="pt-20 pb-12 sm:pt-[100px] sm:pb-[60px]">
            <div class="grid grid-rows-2 grid-cols-2 place-items-center gap-8 lg:gap-0 mx-auto w-fit 2xs:grid-cols-1 lg:grid-rows-1 lg:grid-cols-4">
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-3xl leading-[42px] tracking-[-0.021em] font-bold text-secondary sm:text-5xl sm:leading-[64px] sm:tracking-[-0.022em] xl:text-6xl xl:leading-[80px]">{{ $teachers }}</h1>
                    <h2 class="text-base tracking-[-0.011em] font-bold text-primary sm:text-xl sm:tracking-[-0.017em]">Guru</h2>
                </div>
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-3xl leading-[42px] tracking-[-0.021em] font-bold text-secondary sm:text-5xl sm:leading-[64px] sm:tracking-[-0.022em] xl:text-6xl xl:leading-[80px]">{{ $students }}</h1>
                    <h2 class="text-base tracking-[-0.011em] font-bold text-primary sm:text-xl sm:tracking-[-0.017em]">Siswa</h2>
                </div>
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-3xl leading-[42px] tracking-[-0.021em] font-bold text-secondary sm:text-5xl sm:leading-[64px] sm:tracking-[-0.022em] xl:text-6xl xl:leading-[80px]">{{ $fieldsOfStudy }}</h1>
                    <h2 class="text-base tracking-[-0.011em] font-bold text-primary sm:text-xl sm:tracking-[-0.017em]">Bidang Studi</h2>
                </div>
                <div class="flex flex-col items-center justify-center w-60">
                    <h1 class="text-3xl leading-[42px] tracking-[-0.021em] font-bold text-secondary sm:text-5xl sm:leading-[64px] sm:tracking-[-0.022em] xl:text-6xl xl:leading-[80px]">{{ $extracurriculars->count() }}</h1>
                    <h2 class="text-base tracking-[-0.011em] font-bold text-primary sm:text-xl sm:tracking-[-0.017em]">Ekstrakurikuler</h2>
                </div>
            </div>
        </div>
        <div class="pt-12 pb-10 sm:pt-[60px]">
            <h1 class="relative mb-11 text-center text-2xl tracking-[-0.019em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2 sm:text-3xl sm:tracking-[-0.021em]">Berita Terbaru</h1>
            <div class="no-scrollbar container flex flex-nowrap justify-start items-center gap-7 mx-auto px-0.5 py-5 overflow-auto scroll-px-0.5 snap-x snap-mandatory lg:flex-wrap xl:flex-nowrap lg:justify-center lg:px-0 lg:snap-none">
                @foreach ($newsPosts as $newsPost)
                    <x-homepage.news-card>
                        <x-slot:id>{{ $newsPost->id }}</x-slot:id>
                        <x-slot:thumbnail>{{ $newsPost->foto_berita }}</x-slot:thumbnail>
                        <x-slot:postCreated>{{ Carbon\Carbon::parse($newsPost->waktu_publikasi)->format('d/m/Y') }}</x-slot:postCreated>
                        <x-slot:title>{{ $newsPost->judul }}</x-slot:title>
                        <x-slot:authorImage>{{ $newsPost->foto_pembuat }}</x-slot:authorImage>
                        <x-slot:author>{{ $newsPost->pembuat_berita }}</x-slot:author>
                        {!! $newsPost->deskripsi !!}
                    </x-homepage.news-card>
                @endforeach
            </div>
        </div>
    </x-container>
    <div class="flex flex-col items-center justify-center my-12 py-[60px] bg-[#DCF0E2]">
        <h1 class="relative mb-11 text-center text-2xl tracking-[-0.019em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2 sm:text-3xl sm:tracking-[-0.021em]">Ekstrakurikuler</h1>
        <div class="grid grid-rows-4 grid-cols-2 gap-5 place-items-center 2xs:grid-cols-1 sm:grid-rows-4 sm:grid-cols-2 md:grid-rows-3 md:grid-cols-3 lg:grid-rows-2 lg:grid-cols-4">
            @foreach ($extracurriculars as $extracurricular)
                <x-homepage.extracurricular-card>
                    <x-slot:icon>{{ $extracurricular->ikon }}</x-slot:icon>
                    {{ $extracurricular->nama_ekstrakurikuler }}
                </x-homepage.extracurricular-card>
            @endforeach
        </div>
    </div>
    <x-container>
        <div class="flex flex-col items-center justify-center pt-12 sm:py-[60px]">
            <h1 class="relative mb-11 text-center text-2xl tracking-[-0.019em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2 sm:text-3xl sm:tracking-[-0.021em]">Denah Lokasi</h1>
            <div class="container w-full h-[25rem]" id="map"></div>
        </div>
    </x-container>

    @push('guest-script')
        <script>
            let map = L.map('map').setView([3.722333606341312, 98.68906287106076], 16);
            L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                maxZoom: 18,
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' + 'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                id: 'mapbox/streets-v11',
                tileSize: 512,
                zoomOffset: -1
            }).addTo(map);

            L.marker([3.722333606341312, 98.68906287106076]).addTo(map)
        </script>
    @endpush
</x-guest-layout>