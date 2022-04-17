<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Website SMAN 1 Kuala">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        @stack('guest-styles')
        
        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}" defer></script>
        @stack('guest-head-script')
    </head>
    <body>
        <div class="overflow-hidden font-sans antialiased text-gray-900">
            <x-guest-navbar></x-guest-navbar>
            {{ $slot }}
            <x-footer></x-footer>
        </div>
    </body>
    
    @stack('guest-script')
</html>
