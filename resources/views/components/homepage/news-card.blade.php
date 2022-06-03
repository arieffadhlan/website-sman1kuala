<div class="flex flex-col shrink-0 max-w-[24rem] w-full snap-always snap-start rounded-lg shadow-md lg:shrink">
    <div class="relative flex justify-end items-end rounded-t-lg h-48">
        <img class="absolute w-full h-48 object-content !rounded-t-lg brightness-75" src="{{ asset('storage/images/berita/' . $thumbnail) }}" alt="{{ $thumbnail }}">
        <div class="relative mb-4 mr-4 p-1.5 rounded-lg bg-primary">
            <span class="text-xs font-normal text-white">{{ $postCreated }}</span>
        </div>
    </div>
    <div class="px-6 py-4">
        <div class="flex flex-col gap-y-[6px] mb-4">
            <h1 class="text-xl tracking-[-0.017em] font-semibold text-primary">{!! Str::limit($title, 24) !!}</span>
            <h2 class="text-sm tracking-[-0.006em] font-normal text-neutral">
                {!! Str::limit($slot, 150) !!}
            </h2>
        </div>
        <div class="flex items-center justify-between">
            <div class="flex items-center w-full gap-x-2">
                <img class="w-8 h-8 rounded-full" src="{{ asset('storage/images/akun/' . $authorImage) }}" alt="{{ $authorImage }}">
                <span class="text-xs font-semibold text-primary">{{ $author }}</span>
            </div>
            <a href="{{ route('berita.show', $id) }}" class="text-xs font-semibold text-primary">Baca</a>
        </div>
    </div>
</div>