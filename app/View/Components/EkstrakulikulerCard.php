<?php

namespace App\View\Components;

use Illuminate\View\Component;

class EkstrakulikulerCard extends Component
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
        $ekstrakulikulers = [
            "PMR",
            "Pramuka",
            "Paskibraka",
            "Karya Ilmiah",
            "Futsal",
            "Basket",
            "Fotografi",
            "Musik",
        ];

        return view('components.ekstrakulikuler-card', compact('ekstrakulikulers'));
    }
}
