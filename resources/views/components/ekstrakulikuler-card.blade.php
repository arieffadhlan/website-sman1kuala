@foreach ($ekstrakulikulers as $ekstrakulikuler)
    <div class="flex justify-start items-center max-w-[15rem] w-full p-6 gap-x-4 rounded-[10px] bg-white shadow-md">
        <img src="{{ asset('icons/ekstrakulikuler/ekstrakulikuler-' . $loop->iteration . '.svg') }}" class="w-9 h-9" alt="{{ $ekstrakulikuler }}">
        <h2 class="font-semibold text-base tracking-[-0.011em] text-primary">{{ $ekstrakulikuler }}</h2>
    </div>
@endforeach