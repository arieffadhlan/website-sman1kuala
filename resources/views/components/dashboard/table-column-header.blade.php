@php
    if ($sortDirection == 'asc') {
        $currentsortDirection = 'asc';
        $sortDirection = 'desc';
    } else if ($sortDirection = 'desc') {
        $currentsortDirection = 'desc';
        $sortDirection = 'asc';
    } else {
        $currentsortDirection = '';
        $sortDirection = 'asc';
    }
@endphp

@if ($slot == "Aksi")
    <th scope="col" class="px-6 py-3 text-left text-sm font-semibold bg-gray-200/50 text-primary uppercase tracking-wider">
        <div class="flex justify-center items-center space-x-4 ">
            <div class="flex space-x-1 justify-between items-center">
                <span>{{ $slot }}</span>
            </div>
        </div>
    </th>
@else
    {{-- <th scope="col" class="px-6 py-3 text-left text-sm font-semibold text-primary uppercase tracking-wider" onclick="sortTable({{ $columnId }})"> --}}
    <th scope="col" class="px-6 py-3 text-left text-sm font-semibold bg-gray-200/50 text-primary uppercase tracking-wider">
        <div class="flex justify-center items-center space-x-4 ">
            {{-- <a href="#" class="flex space-x-1 justify-between items-center">
                <span>{{ $slot }}</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="#252F3F">
                    <path d="M5 12a1 1 0 102 0V6.414l1.293 1.293a1 1 0 001.414-1.414l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L5 6.414V12zM15 8a1 1 0 10-2 0v5.586l-1.293-1.293a1 1 0 00-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L15 13.586V8z" />
                </svg>
            </a> --}}   
            <a href="{{ route($tableName, ['sortDirection' => $sortDirection, 'sortColumn' => $columnName]) }}" class="flex space-x-1 justify-between items-center">
                <span class="whitespace-nowrap">{{ $slot }}</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="#252F3F">
                    <path d="M5 12a1 1 0 102 0V6.414l1.293 1.293a1 1 0 001.414-1.414l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L5 6.414V12zM15 8a1 1 0 10-2 0v5.586l-1.293-1.293a1 1 0 00-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L15 13.586V8z" />
                </svg>
            </a>
        </div>
    </th>
@endif