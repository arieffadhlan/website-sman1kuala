@props(['active', 'icon'])

@php
$linkClasses = ($active ?? false)
            ? 'block py-3 text-sm font-bold text-primary md:text-white'
            : 'block py-3 text-sm font-medium text-primary/70 md:text-white/70';

$iconClasses = ($active ?? false)
            ? 'block mr-2 text-sm fa-fw ' . $icon . ' text-primary md:text-white'
            : 'block mr-2 text-sm fa-fw ' . $icon . ' text-primary/70 md:text-white/70';
@endphp

<a {{ $attributes->merge(['class' => $linkClasses]) }}>
    <div class="inline-block mr-1"><i {{ $attributes->merge(['class' => $iconClasses]) }}></i></div>
    {{ $slot }}
</a>
