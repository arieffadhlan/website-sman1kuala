<?php

use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::view('/', 'pages.homepage.index')->name('beranda');
Route::view('/berita', 'pages.homepage.berita')->name('berita');

Route::prefix('profil')->group(function () {
    Route::view('sambutan-kepala-sekolah', 'pages.homepage.profil.sambutan-kepala-sekolah')->name('sambutan-kepala-sekolah');
    Route::view('sejarah', 'pages.homepage.profil.sejarah')->name('sejarah');
    Route::view('visi-misi', 'pages.homepage.profil.visi-misi')->name('visi-misi');
});

Route::prefix('akademik')->group(function () {
    Route::view('kalender-akademik', 'pages.homepage.akademik.kalender-akademik')->name('kalender-akademik');
});

Route::get('/dashboard', function () {
    return view('pages.dashboard.index');
})->middleware(['auth'])->name('dashboard');
