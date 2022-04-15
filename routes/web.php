<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'homepage')->name('beranda');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__ . '/auth.php';
