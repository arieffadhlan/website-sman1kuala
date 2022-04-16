@props(['active'])

@php
$classes = ($active ?? false)
            ? 'font-semibold text-sm tracking-[-0.006em]'
            : 'font-normal text-sm tracking-[-0.006em]';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
