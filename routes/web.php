<?php

use App\Http\Controllers\ClassController;
use App\Http\Controllers\TeacherController;
use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::middleware('guest')->group(function () {
    Route::view('/', 'pages.homepage.index')->name('beranda');
    Route::prefix('profil')->group(function () {
        Route::view('sambutan-kepala-sekolah', 'pages.homepage.profil.sambutan-kepala-sekolah')->name('sambutan-kepala-sekolah');
        Route::view('sejarah', 'pages.homepage.profil.sejarah')->name('sejarah');
        Route::view('visi-misi', 'pages.homepage.profil.visi-misi')->name('visi-misi');
    });
    Route::prefix('akademik')->group(function () {
        Route::view('kalender-akademik', 'pages.homepage.akademik.kalender-akademik')->name('kalender-akademik');
        Route::view('tata-tertib', 'pages.homepage.akademik.tata-tertib')->name('tata-tertib');
    });
    Route::view('/berita', 'pages.homepage.berita')->name('berita');
});

Route::middleware('auth')->group(function () {
    Route::view('dashboard', 'pages.dashboard.index')->name('dashboard');
    Route::get('/data-master/kelas', [ClassController::class, 'index'])->name('kelas');
    Route::get('/data-master/guru', [TeacherController::class, 'index'])->name('guru');
});
