<?php

use App\Http\Controllers\FasilitasController;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\AkunController;
use App\Http\Controllers\BeritaController;
use App\Http\Controllers\BidangStudiController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DirektoriController;
use App\Http\Controllers\EkstrakurikulerController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\HomepageController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\PrestasiController;
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
        Route::view('struktur-organisasi', 'pages.homepage.profil.struktur-organisasi')->name('struktur-organisasi');
    });

    Route::prefix('akademik')->group(function () {
        Route::view('kalender-akademik', 'pages.homepage.akademik.kalender-akademik')->name('kalender-akademik');
        Route::view('tata-tertib', 'pages.homepage.akademik.tata-tertib')->name('tata-tertib');
    });

    Route::get('berita', [BeritaController::class, 'indexHomepage'])->name('berita-homepage');
    Route::get('berita/{id}', [BeritaController::class, 'show'])->name('berita.show');
    Route::get('direktori', DirektoriController::class)->name('direktori');
});

Route::middleware('auth')->group(function () {
    Route::get('dashboard', DashboardController::class)->name('dashboard');

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

    Route::controller(BidangStudiController::class)->prefix('data-master/')->group(function () {
        Route::get('bidang-studi', 'index')->name('bidang-studi');
        Route::get('bidang-studi/create', 'create')->name('bidang-studi.create');
        Route::post('bidang-studi', 'store')->name('bidang-studi.store');
        Route::get('bidang-studi/{id}/edit', 'edit')->name('bidang-studi.edit');
        Route::put('bidang-studi/{id}', 'update')->name('bidang-studi.update');
        Route::delete('bidang-studi/{id}', 'destroy')->name('bidang-studi.destroy');
    });

    Route::controller(GuruController::class)->prefix('data-master/')->group(function () {
        Route::get('guru', 'index')->name('guru');
        Route::get('guru/create', 'create')->name('guru.create');
        Route::post('guru', 'store')->name('guru.store');
        Route::get('guru/{nip}/edit', 'edit')->name('guru.edit');
        Route::put('guru/{nip}', 'update')->name('guru.update');
        Route::delete('guru/{nip}', 'destroy')->name('guru.destroy');
    });

    Route::controller(SiswaController::class)->prefix('data-master/')->group(function () {
        Route::get('siswa', 'index')->name('siswa');
        Route::get('siswa/create', 'create')->name('siswa.create');
        Route::post('siswa', 'store')->name('siswa.store');
        Route::get('siswa/{nis}/edit', 'edit')->name('siswa.edit');
        Route::put('siswa/{nis}', 'update')->name('siswa.update');
        Route::delete('siswa/{nis}', 'destroy')->name('siswa.destroy');
    });

    Route::controller(PegawaiController::class)->prefix('data-master/')->group(function () {
        Route::get('pegawai', 'index')->name('pegawai');
        Route::get('pegawai/create', 'create')->name('pegawai.create');
        Route::post('pegawai', 'store')->name('pegawai.store');
        Route::get('pegawai/{id}/edit', 'edit')->name('pegawai.edit');
        Route::put('pegawai/{id}', 'update')->name('pegawai.update');
        Route::delete('pegawai/{id}', 'destroy')->name('pegawai.destroy');
    });

    Route::controller(PrestasiController::class)->prefix('data-master/')->group(function () {
        Route::get('prestasi', 'index')->name('prestasi');
        Route::get('prestasi/create', 'create')->name('prestasi.create');
        Route::post('prestasi', 'store')->name('prestasi.store');
        Route::get('prestasi/{nip}/edit', 'edit')->name('prestasi.edit');
        Route::put('prestasi/{nip}', 'update')->name('prestasi.update');
        Route::delete('prestasi/{nip}', 'destroy')->name('prestasi.destroy');
    });

    Route::controller(FasilitasController::class)->prefix('data-master/')->group(function () {
        Route::get('fasilitas', 'index')->name('fasilitas');
        Route::get('fasilitas/create', 'create')->name('fasilitas.create');
        Route::post('fasilitas', 'store')->name('fasilitas.store');
        Route::get('fasilitas/{id}/edit', 'edit')->name('fasilitas.edit');
        Route::put('fasilitas/{id}', 'update')->name('fasilitas.update');
        Route::delete('fasilitas/{id}', 'destroy')->name('fasilitas.destroy');
    });

    Route::controller(EkstrakurikulerController::class)->prefix('data-master/')->group(function () {
        Route::get('ekstrakurikuler', 'index')->name('ekstrakurikuler');
        Route::get('ekstrakurikuler/create', 'create')->name('ekstrakurikuler.create');
        Route::post('ekstrakurikuler', 'store')->name('ekstrakurikuler.store');
        Route::get('ekstrakurikuler/{nip}/edit', 'edit')->name('ekstrakurikuler.edit');
        Route::put('ekstrakurikuler/{nip}', 'update')->name('ekstrakurikuler.update');
        Route::delete('ekstrakurikuler/{nip}', 'destroy')->name('ekstrakurikuler.destroy');
    });

    Route::controller(BeritaController::class)->prefix('data-master/')->group(function () {
        Route::get('berita', 'index')->name('berita');
        Route::get('berita/create', 'create')->name('berita.create');
        Route::post('berita', 'store')->name('berita.store');
        Route::get('berita/{id}', 'show')->name('berita.show')->withoutMiddleware('auth')->middleware('guest');
        Route::get('berita/{id}/edit', 'edit')->name('berita.edit');
        Route::put('berita/{id}', 'update')->name('berita.update');
        Route::delete('berita/{id}', 'destroy')->name('berita.destroy');
    });

    Route::controller(AkunController::class)->prefix('data-master/')->group(function () {
        Route::get('akun', 'index')->name('akun');
        Route::get('akun/create', 'create')->name('akun.create');
        Route::post('akun', 'store')->name('akun.store');
        Route::get('akun/{id}/edit', 'edit')->name('akun.edit');
        Route::put('akun/{id}', 'update')->name('akun.update');
        Route::delete('akun/{id}', 'destroy')->name('akun.destroy');
    });
});
