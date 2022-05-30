<?php

namespace App\Http\Controllers;

use App\Models\tbl_ekstrakurikuler;
use Illuminate\Http\Request;

class HomepageController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $extracurriculars = tbl_ekstrakurikuler::get();
        return view('pages.homepage.index', compact('extracurriculars'));
    }
}
