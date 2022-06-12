<x-guest-layout>
    <x-container>
        <div class="pt-[180px] pb-12 sm:pb-[60px]">
            <h1 class="relative mb-11 text-center text-2xl tracking-[-0.019em] font-bold text-primary after:content-[' '] after:absolute after:w-[120px] after:h-1 after:left-1/2 after:bottom-[-12px] after:bg-secondary after:-translate-x-1/2 sm:text-3xl sm:tracking-[-0.021em]">Direktori Siswa</h1>
            <div class="flex flex-wrap justify-end gap-4 mb-7 lg:gap-0">
                <form action="{{ route('direktori', request()->query()) }}">
                    <div class="flex justify-end h-10">
                        {{-- <input type="text" onkeyup="searchData()" class="placeholder:text-gray-400/60 form-control px-3 py-1.5 m-0 border border-gray-400/60 rounded-lg bg-clip-padding text-base font-normal bg-white text-primary shadow-sm transition ease-in-out focus:ring-0 focus:border focus:border-solid focus:!border-dashboard focus:bg-white focus:outline-none" id="datatableInput" placeholder="Cari..." aria-label="Search" aria-describedby="dataTableSearchButton"> --}}
                        <input type="text" name="searchStudent" value="{{ $searchStudent }}" class="placeholder:text-gray-400/60 form-control px-3 py-1.5 m-0 border-y border-l border-gray-400/60 rounded-l-lg bg-clip-padding text-base font-normal bg-white text-primary shadow-sm transition ease-in-out focus:ring-0 focus:!border-dashboard focus:bg-white focus:outline-none" id="datatableInput" placeholder="Cari..." aria-label="Search" aria-describedby="dataTableSearchButton">
                        <button type="submit" class="btn flex items-center px-4 py-2.5 rounded-tr-lg rounded-br-lg text-xs leading-tight uppercase font-medium transition duration-150 ease-in-out bg-secondary text-white shadow-sm hover:bg-[#49a162] active:bg-[#397d4c]" type="button" id="dataTableSearchButton">
                            <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" class="w-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>

            <x-dashboard.datatable>
                <x-slot:tableColumnHeaders>
                    <x-dashboard.table-column-header table-name="direktori" column-name="nis" :sort-column="$sortColumn" :sort-direction="$sortDirection">NIS</x-dashboard.table-column-header>
                    <x-dashboard.table-column-header table-name="direktori" column-name="nama_siswa" :sort-column="$sortColumn" :sort-direction="$sortDirection">Nama</x-dashboard.table-column-header>
                    <x-dashboard.table-column-header table-name="direktori" column-name="jk_siswa" :sort-column="$sortColumn" :sort-direction="$sortDirection">Jenis Kelamin</x-dashboard.table-column-header>
                    <x-dashboard.table-column-header table-name="direktori" column-name="agama_siswa" :sort-column="$sortColumn" :sort-direction="$sortDirection">Agama</x-dashboard.table-column-header>
                    <x-dashboard.table-column-header table-name="direktori" column-name="kelas" :sort-column="$sortColumn" :sort-direction="$sortDirection">Kelas</x-dashboard.table-column-header>
                    <x-dashboard.table-column-header table-name="direktori" column-name="wali_kelas" :sort-column="$sortColumn" :sort-direction="$sortDirection">Wali Kelas</x-dashboard.table-column-header>
                </x-slot:tableColumnHeaders>
                
                @if ($students->isNotEmpty())
                    @foreach($students as $student)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->nis }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->nama_siswa }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->jk_siswa }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->agama_siswa }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->kelas }}</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $student->wali_kelas }}</div>
                            </td>
                        </tr>
                    @endforeach

                    <x-slot:pagination>
                        {{ $students->onEachSide(1)->links() }}
                    </x-slot:pagination>
                @else
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap" colspan="6">
                            <div class="flex justify-center items-start text-sm font-medium text-gray-900">Data siswa tidak ditemukan.</div>
                        </td>
                    </tr>
        
                    <x-slot:pagination></x-slot:pagination>
                @endif
            </x-dashboard.datatable>
        </div>
    </x-container>
</x-guest-layout>