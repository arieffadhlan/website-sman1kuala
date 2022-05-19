<?php

namespace App\View\Components;

use Illuminate\View\Component;

class GuestNavbar extends Component
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
        $navLinks = [
            'Beranda' => '/',
            'Profil' => '/#',
            'Akademik' => '/#',
            'Berita' => '/berita',
            'Galeri' => '/galeri'
        ];

        return view('layouts.guest-navbar', compact('navLinks'));
    }
}
