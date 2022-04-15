@props(['active'])

@php
$classes = ($active ?? false)
            ? 'inline-flex items-center font-semibold text-base leading-[22px] text-primary'
            : 'inline-flex items-center font-normal text-base leading-[22px] text-neutral';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
