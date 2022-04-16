<?php

namespace App\View\Components\Homepage;

use Illuminate\View\Component;

class ExtracurricularCard extends Component
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
        $extracurricularActivities = [
            "PMR",
            "Pramuka",
            "Paskibraka",
            "Karya Ilmiah",
            "Futsal",
            "Basket",
            "Fotografi",
            "Musik",
        ];

        return view('components.homepage.extracurricular-card', compact('extracurricularActivities'));
    }
}
