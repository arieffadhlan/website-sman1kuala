<?php

namespace App\Http\Controllers;

use App\Models\tbl_siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentController extends Controller
{
    public function index()
    {
        $students = DB::table('tbl_siswas')
        ->join('tbl_kelas', 'tbl_kelas.id', '=', 'tbl_siswas.id_kelas')
        ->paginate(10);

        return view('pages.dashboard.data-master.siswa', compact('students'));
    }
}
