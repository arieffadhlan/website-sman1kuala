<?php

use App\Http\Controllers\GuruController;
use App\Http\Controllers\KelasController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiswaController;

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

    Route::view('berita', 'pages.homepage.berita')->name('berita');
});

Route::middleware('auth')->group(function () {
    Route::view('dashboard', 'pages.dashboard.index')->name('dashboard');

    Route::controller(KelasController::class)->prefix('data-master/')->group(function () {
        Route::get('kelas', 'index')->name('kelas');
        Route::get('kelas/create', 'create')->name('kelas.create');
        Route::post('kelas', 'store')->name('kelas.store');
        Route::get('kelas/{id}/edit', 'edit')->name('kelas.edit');
        Route::put('kelas/{id}', 'update')->name('kelas.update');
        Route::delete('kelas/{id}', 'destroy')->name('kelas.destroy');
    });

    Route::controller(GuruController::class)->prefix('data-master/')->group(function () {
        Route::get('guru', 'index')->name('guru');
        Route::get('guru/create', 'create')->name('guru.create');
        Route::post('guru', 'store')->name('guru.store');
        Route::get('guru/{id}/edit', 'edit')->name('guru.edit');
        Route::put('guru/{id}', 'update')->name('guru.update');
        Route::delete('guru/{id}', 'destroy')->name('guru.destroy');
    });

    Route::controller(SiswaController::class)->prefix('data-master/')->group(function () {
        Route::get('siswa', 'index')->name('siswa');
        Route::get('siswa/create', 'create')->name('siswa.create');
        Route::post('siswa', 'store')->name('siswa.store');
        Route::get('siswa/{NIS}/edit', 'edit')->name('siswa.edit');
        // Route::put('siswa/{id}', 'update')->name('siswa.update');
        Route::delete('siswa/{NIS}', 'destroy')->name('siswa.destroy');
    });
});
