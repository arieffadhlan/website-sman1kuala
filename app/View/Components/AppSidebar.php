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
            'Guru' => '/data-master/guru',
            'Siswa' => '/data-master/siswa',
            'Pegawai' => '/data-master/pegawai',
            'Prestasi' => '/data-master/prestasi',
            'Fasilitas' => '/data-master/fasilitas',
            'Ekstrakurikuler' => '/data-master/esktrakurikuler',
            'Berita' => '/data-master/berita',
            'Akun' => '/data-master/akun'
        ];

        $accountDataLinks = [
            'Edit Akun' => 'akun/edit-akun',
        ];

        $masterDataIcons = [
            'Dashboard' => 'fas fa-chart-area',
            'Kelas' => 'fas fa-school',
            'Guru' => 'fas fa-chalkboard-teacher',
            'Siswa' => 'fas fa-user-graduate',
            'Pegawai' => 'fas fa-user-tie',
            'Prestasi' => 'fas fa-star',
            'Fasilitas' => 'fas fa-building',
            'Ekstrakurikuler' => 'fas fa-futbol',
            'Berita' => 'fas fa-newspaper',
            'Akun' => 'fas fa-users'
        ];

        $accountDataIcons = [
            'Edit Akun' => 'fas fa-edit',
        ];

        return view('layouts.app-sidebar', compact('masterDataLinks', 'accountDataLinks', 'masterDataIcons', 'accountDataIcons'));
    }
}
