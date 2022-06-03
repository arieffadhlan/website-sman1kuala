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

        $newsPostQuery = tbl_berita::query();
        $newsPosts = $newsPostQuery
            ->select('tbl_beritas.id', 'tbl_akuns.nama as nama_pembuat', 'tbl_akuns.foto as foto_pembuat', 'tbl_beritas.foto', 'judul', 'deskripsi', 'tbl_beritas.created_at')
            ->join('tbl_akuns', 'tbl_akuns.id', '=', 'tbl_beritas.id_akun')
            ->paginate(10);

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
