<?php

namespace App\Http\Controllers;

use App\Models\tbl_berita;
use App\Models\tbl_ekstrakurikuler;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomepageController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke()
    {
        $classes = DB::table('tbl_kelas')->count();
        $fieldsOfStudy = DB::table('tbl_bidang_studis')->count();
        $teachers = DB::table('tbl_gurus')->count();
        $students = DB::table('tbl_siswas')->count();
        $achievements = DB::table('tbl_prestasis')->count();
        $extracurriculars = tbl_ekstrakurikuler::get();

        $newsPosts = DB::select('SELECT * FROM tampil_berita');

        return view('pages.homepage.index', [
            'classes' => $classes,
            'fieldsOfStudy' => $fieldsOfStudy,
            'teachers' => $teachers,
            'students' => $students,
            'achievements' => $achievements,
            'extracurriculars' => $extracurriculars,
            'newsPosts' => $newsPosts
        ]);
    }
}
