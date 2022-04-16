@props(['active'])

@php
$classes = ($active ?? false)
            ? 'inline-flex items-center font-semibold text-sm tracking-[-0.006em] text-primary'
            : 'inline-flex items-center font-normal text-sm tracking-[-0.006em] text-neutral';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
