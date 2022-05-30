<div class="w-full sm:w-[244px]">
    <div class="flex flex-col relative min-w-0 break-words rounded-lg shadow-lg bg-white xl:mb-0">
        <div class="flex-auto p-6">
            <div class="flex flex-wrap">
                <div class="relative flex-1 flex-grow w-full max-w-full">
                    <h5 class="font-bold text-sm uppercase text-primary/60 mb-1">{{ $slot }}</h5>
                    <span class="font-semibold text-2xl text-primary">{{ $counts }}</span>
                </div>
                <div class="flex-initial relative w-auto">
                    <div class="inline-flex items-center justify-center p-3 w-12 h-12 text-center rounded-full shadow-lg text-white bg-red-500">
                        {{ $icon }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>