<?php

use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::view('/', 'pages.homepage.index')->name('beranda');

Route::get('/dashboard', function () {
    return view('pages.dashboard.index');
})->middleware(['auth'])->name('dashboard');
