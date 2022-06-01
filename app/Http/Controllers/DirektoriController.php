<?php

namespace App\Http\Controllers;

use App\Models\tbl_siswa;
use Illuminate\Http\Request;

class DirektoriController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $studentQuery = tbl_siswa::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchStudent = $request->query('searchStudent');

        if ($sortColumn && $sortDirection) {
            $studentQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchStudent) {
            $studentQuery->orWhere('nis', 'like', "%$searchStudent%")
                ->orWhere('nama_siswa', 'like', "%$searchStudent%")
                ->orWhere('jk_siswa', 'like', "%$searchStudent%")
                ->orWhere('agama_siswa', 'like', "%$searchStudent%")
                ->orWhere('tbl_kelas.nama', 'like', "%$searchStudent%");
        }

        $students = $studentQuery
            ->select('tbl_kelas.nama', 'nama_siswa', 'jk_siswa', 'agama_siswa', 'nis')
            ->join('tbl_kelas', 'tbl_kelas.id', '=', 'tbl_siswas.id_kelas')
            ->paginate(10);

        return view('pages.homepage.direktori', compact('students', 'sortColumn', 'sortDirection', 'searchStudent'));
    }
}
