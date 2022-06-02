<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
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
        $staffs = DB::table('tbl_pegawais')->count();
        $achievements = DB::table('tbl_prestasis')->count();
        $facilities = DB::table('tbl_fasilitas')->count();
        $extracurriculars = DB::table('tbl_ekstrakurikulers')->count();
        $newsPosts = DB::table('tbl_beritas')->count();
        $accounts = DB::table('tbl_akuns')->count();

        return view('pages.dashboard.index', [
            'classes' => $classes,
            'fieldsOfStudy' => $fieldsOfStudy,
            'teachers' => $teachers,
            'students' => $students,
            'staffs' => $staffs,
            'achievements' => $achievements,
            'facilities' => $facilities,
            'extracurriculars' => $extracurriculars,
            'newsPosts' => $newsPosts,
            'accounts' => $accounts
        ]);
    }
}
