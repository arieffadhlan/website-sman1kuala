@foreach ($extracurricularActivities as $extracurricularActivity)
    <div class="flex items-center justify-start gap-x-4 p-6 max-w-[15rem] w-full rounded-[10px] bg-white shadow-md">
        <img src="{{ asset('icons/ekstrakurikuler/ekstrakurikuler-' . $loop->iteration . '.svg') }}" class="w-9 h-9" alt="{{ $extracurricularActivity }}">
        <h2 class="font-semibold text-base tracking-[-0.011em] text-primary">{{ $extracurricularActivity }}</h2>
    </div>
@endforeach