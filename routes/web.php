<?php

use App\Http\Controllers\AkunController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EkstrakurikulerController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\HomepageController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SiswaController;
use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::middleware('guest')->group(function () {
    Route::get('/', HomepageController::class)->name('beranda');

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
    Route::get('dashboard', DashboardController::class)->name('dashboard');
    Route::get('/data-master/siswa', [SiswaController::class, 'index'])->name('siswa');

    Route::controller(ProfileController::class)->group(function () {
        Route::get('akun-saya', 'index')->name('akun-saya');
        Route::put('akun-saya', 'update')->name('akun-saya.update');
    });

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
        Route::get('guru/{nip}/edit', 'edit')->name('guru.edit');
        Route::put('guru/{nip}', 'update')->name('guru.update');
        Route::delete('guru/{nip}', 'destroy')->name('guru.destroy');
    });

    Route::controller(EkstrakurikulerController::class)->prefix('data-master/')->group(function () {
        Route::get('ekstrakurikuler', 'index')->name('ekstrakurikuler');
        Route::get('ekstrakurikuler/create', 'create')->name('ekstrakurikuler.create');
        Route::post('ekstrakurikuler', 'store')->name('ekstrakurikuler.store');
        Route::get('ekstrakurikuler/{nip}/edit', 'edit')->name('ekstrakurikuler.edit');
        Route::put('ekstrakurikuler/{nip}', 'update')->name('ekstrakurikuler.update');
        Route::delete('ekstrakurikuler/{nip}', 'destroy')->name('ekstrakurikuler.destroy');
    });

    Route::controller(AkunController::class)->prefix('data-master/')->group(function () {
        Route::get('akun', 'index')->name('akun');
        Route::get('akun/create', 'create')->name('akun.create');
        Route::post('akun', 'store')->name('akun.store');
        Route::get('akun/{id}/edit', 'edit')->name('akun.edit');
        Route::put('akun/{id}', 'update')->name('akun.update');
        Route::delete('akun/{id}', 'destroy')->name('akun.destroy');
    });

    Route::controller(SiswaController::class)->prefix('data-master/')->group(function () {
        Route::get('siswa', 'index')->name('siswa');
        Route::get('siswa/create', 'create')->name('siswa.create');
        Route::post('siswa', 'store')->name('siswa.store');
        Route::get('siswa/{nis}/edit', 'edit')->name('siswa.edit');
        Route::put('siswa/{nis}', 'update')->name('siswa.update');
        Route::delete('siswa/{nis}', 'destroy')->name('siswa.destroy');
    });
});
