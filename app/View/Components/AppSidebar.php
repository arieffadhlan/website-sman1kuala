<?php

namespace App\View\Components;

use Illuminate\View\Component;

class AppSidebar extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $masterDataLinks = [
            'Dashboard' => '/dashboard',
            'Kelas' => '/data-master/kelas',
            'Bidang Studi' => '/data-master/bidang-studi',
            'Guru' => '/data-master/guru',
            'Siswa' => '/data-master/siswa',
            'Pegawai' => '/data-master/pegawai',
            'Prestasi' => '/data-master/prestasi',
            'Fasilitas' => '/data-master/fasilitas',
            'Ekstrakurikuler' => '/data-master/ekstrakurikuler',
            'Berita' => '/data-master/berita',
            'Akun' => '/data-master/akun'
        ];

        $masterDataIcons = [
            'Dashboard' => 'fas fa-chart-area',
            'Kelas' => 'fas fa-school',
            'Bidang Studi' => 'fas fa-book',
            'Guru' => 'fas fa-chalkboard-teacher',
            'Siswa' => 'fas fa-user-graduate',
            'Pegawai' => 'fas fa-user-tie',
            'Prestasi' => 'fas fa-star',
            'Fasilitas' => 'fas fa-building',
            'Ekstrakurikuler' => 'fas fa-futbol',
            'Berita' => 'fas fa-newspaper',
            'Akun' => 'fas fa-users'
        ];

        return view('layouts.app-sidebar', compact('masterDataLinks', 'masterDataIcons'));
    }
}
