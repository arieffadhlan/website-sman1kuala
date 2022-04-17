<?php

use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::view('/', 'pages.homepage.index')->name('beranda');

Route::prefix('profil')->group(function () {
    Route::view('sambutan-kepala-sekolah', 'pages.homepage.profil.headmaster-welcome')->name('sambutan-kepala-sekolah');
});

Route::get('/dashboard', function () {
    return view('pages.dashboard.index');
})->middleware(['auth'])->name('dashboard');
