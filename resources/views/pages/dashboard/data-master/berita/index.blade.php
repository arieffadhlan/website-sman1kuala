<x-app-layout>
    <x-alert></x-alert>
    <h1 class="mb-7 font-medium text-lg text-primary">Data berita</h1>
    <div class="flex flex-wrap justify-between gap-4 mb-7 lg:gap-0">
        <div>
            <a href="{{ route('berita.create') }}" class="flex justify-center items-center px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-dashboard font-semibold text-white shadow-sm transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Tambah Data berita
            </a>
        </div>
        <form action="{{ route('berita', request()->query()) }}">
            <div class="flex justify-end h-10">
                <input type="text" name="searchNewsPost" value="{{ $searchNewsPost }}" class="placeholder:text-gray-400/60 form-control px-3 py-1.5 m-0 border-y border-l border-gray-400/60 rounded-l-lg bg-clip-padding text-base font-normal bg-white text-primary shadow-sm transition ease-in-out focus:ring-0 focus:!border-dashboard focus:bg-white focus:outline-none" id="datatableInput" placeholder="Cari..." aria-label="Search" aria-describedby="dataTableSearchButton">
                <button type="submit" class="btn flex items-center px-4 py-2.5 rounded-tr-lg rounded-br-lg text-xs leading-tight uppercase font-medium transition duration-150 ease-in-out bg-dashboard text-white shadow-sm hover:bg-[#1f604f] active:bg-[#387162]" type="button" id="dataTableSearchButton">
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" class="w-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                    </svg>
                </button>
            </div>
        </form>
    </div>

    <x-dashboard.datatable>
        <x-slot:tableColumnHeaders>
            <x-dashboard.table-column-header table-name="berita" column-name="foto" :sort-column="$sortColumn" :sort-direction="$sortDirection">Pembuat</x-dashboard.table-column-header>
            <x-dashboard.table-column-header table-name="berita" column-name="foto" :sort-column="$sortColumn" :sort-direction="$sortDirection">Foto</x-dashboard.table-column-header>
            <x-dashboard.table-column-header table-name="berita" column-name="judul" :sort-column="$sortColumn" :sort-direction="$sortDirection">Judul</x-dashboard.table-column-header>
            <x-dashboard.table-column-header table-name="berita" column-name="deskripsi" :sort-column="$sortColumn" :sort-direction="$sortDirection">Deskripsi</x-dashboard.table-column-header>
            <x-dashboard.table-column-header table-name="berita" column-name="aksi" :sort-column="$sortColumn" :sort-direction="$sortDirection">Aksi</x-dashboard.table-column-header>
        </x-slot:tableColumnHeaders>
        
        @if ($newsPosts->isNotEmpty())
            @foreach($newsPosts as $newsPost)
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $newsPost->nama_pembuat }}</div>
                    </td>
                    <td class="flex justify-center px-6 py-4 whitespace-nowrap">
                        <a href="{{ asset('storage/images/berita/' . $newsPost->foto) }}" target="_blank">
                            <img style="width: 50px" src="{{ asset('storage/images/berita/' . $newsPost->foto) }}" alt="{{ $newsPost->foto }}">
                        </a>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $newsPost->judul }}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex justify-center items-start text-sm font-medium text-gray-900">{!! Str::limit($newsPost->deskripsi, 50) !!}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="flex justify-center items-center gap-x-6">
                            <a href="{{ route('berita.edit', $newsPost->id) }}" class="flex justify-center items-start text-sm font-medium text-blue-800">
                                <div class="inline-block mr-1"><i class="block text-sm fa-fw fas fa-edit text-blue-800"></i></div>
                                <span>Ubah</span>
                            </a>
                            <button type="button" class="openModal{{ $newsPost->id }} flex justify-center items-start text-sm font-medium text-red-500">
                                <div class="inline-block mr-1"><i class="block text-sm fa-fw fas fa-trash text-red-500"></i></div>
                                <span>Hapus</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <x-modal :id="$newsPost->id" route="{{ route('berita.destroy', $newsPost->id) }}">
                    <x-slot:modalTitle>Hapus Data</x-slot:modalTitle>
                    Apakah Anda yakin ingin menghapus data berita {{ $newsPost->judul }}? Semua data terkait berita tersebut akan permanen dihapus. Aksi ini tidak bisa dibatalkan ketika data telah terhapus.
                </x-modal>
            @endforeach

            <x-slot:pagination>
                {{ $newsPosts->onEachSide(5)->links() }}
            </x-slot:pagination>
        @else
            <tr>
                <td class="px-6 py-4 whitespace-nowrap" colspan="5">
                    <div class="flex justify-center items-start text-sm font-medium text-gray-900">Data berita tidak ada.</div>
                </td>
            </tr>

            <x-slot:pagination></x-slot:pagination>
        @endif
    </x-dashboard>
</x-app-layout>