@props(['value'])

<label {{ $attributes->merge(['class' => 'block font-normal text-sm text-primary']) }}>
    {{ $value ?? $slot }}
</label>
