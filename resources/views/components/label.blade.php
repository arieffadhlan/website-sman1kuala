@props(['value'])

<label {{ $attributes->merge(['class' => 'block font-normal text-sm text-primary/90']) }}>
    {{ $value ?? $slot }}
</label>
