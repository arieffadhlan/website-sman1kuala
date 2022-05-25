<x-app-layout>
    <h1 class="mb-7 font-medium text-lg text-primary">Data Kelas</h1>
    <div class="flex flex-wrap justify-between gap-4 mb-7 lg:gap-0">
        <div>
            <a href="#" class="block px-5 py-2 border border-transparent rounded-lg text-center text-sm tracking-[-0.006em] bg-dashboard font-semibold text-white transition duration-250 ease-in-out hover:bg-[#1f604f] active:bg-[#387162] disabled:opacity-25">
                Tambah Data Kelas
            </a>
        </div>
        <form action="{{ route('kelas', request()->query()) }}">
            <div class="flex justify-end h-10">
                <input type="text" onkeyup="searchData()" class="placeholder:text-gray-400/60 form-control px-3 py-1.5 m-0 border border-gray-400/60 rounded-lg bg-clip-padding text-base font-normal bg-white text-primary shadow-sm transition ease-in-out focus:ring-0 focus:border focus:border-solid focus:!border-dashboard focus:bg-white focus:outline-none" id="datatableInput" placeholder="Cari..." aria-label="Search" aria-describedby="dataTableSearchButton">
                {{-- <button class="btn flex items-center px-4 py-2.5 rounded-tr-lg rounded-br-lg text-xs leading-tight uppercase font-medium transition duration-150 ease-in-out bg-dashboard text-white shadow-sm hover:bg-[#1f604f] active:bg-[#387162]" type="button" id="dataTableSearchButton">
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" class="w-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                    </svg>
                </button> --}}
            </div>
        </form>
    </div>

    <div class="flex flex-col mb-10">
        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200" id="datatable">
                        <thead class="bg-gray-50">
                            <tr>
                                <x-dashboard.table-column-header :columnId="0">Kelas</x-dashboard.table-column-header>
                                <x-dashboard.table-column-header :columnId="1">Wali Kelas</x-dashboard.table-column-header>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach($classes as $class)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex justify-center items-start text-sm font-medium text-gray-900">{{ $class->nama }}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    @if ($class->wali_kelas == null)
                                        <div class="flex justify-center items-start text-sm text-gray-500">-</div>
                                    @else
                                        <div class="flex justify-center items-start text-sm text-gray-500">{{ $class->wali_kelas }}</div>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="mt-6">
            {{ $classes->onEachSide(5)->links() }}
        </div>
    </div>
</x-app-layout>