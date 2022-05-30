<div class="flex flex-col items-center justify-start gap-4 p-6 max-w-[15rem] w-full rounded-[10px] bg-white shadow-md sm:flex-row">
    <img src="{{ asset('storage/icons/' . $icon) }}" alt="{{ $icon }}" class="w-9 h-9">
    <h2 class="font-semibold text-base tracking-[-0.011em] text-primary">{{ $slot }}</h2>
</div>