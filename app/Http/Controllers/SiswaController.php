<?php

namespace App\Http\Controllers;
use App\Http\Requests\SiswaRequest;
use App\Models\tbl_siswa;
use App\Models\tbl_kelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        $studentQuery = tbl_siswa::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchStudent = $request->query('searchStudent');

        if ($sortColumn && $sortDirection) {
            $studentQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchStudent) {
            $studentQuery = $studentQuery->where(function ($query) use ($searchStudent) {
                $query->orWhere('NIS', 'like', "%$searchStudent%")
                    ->orWhere('nama_siswa', 'like', "%$searchStudent%")
                    ->orWhere('jk_siswa', 'like', "%$searchStudent%")
                    ->orWhere('agama_siswa', 'like', "%$searchStudent%");
            }); 
        }

        $students = $studentQuery
        ->select('tbl_kelas.nama', 'nama_siswa', 'jk_siswa', 'agama_siswa', 'NIS')
        ->join('tbl_kelas', 'tbl_kelas.id', '=', 'tbl_siswas.id_kelas')
        ->paginate(10);
        
        return view('pages.dashboard.data-master.siswa.index', compact('students', 'sortColumn', 'sortDirection', 'searchStudent'));
    }

    public function create()
    {
        $classes = tbl_kelas::get();
        return view('pages.dashboard.data-master.siswa.create', compact('classes'));
    }

    public function store(SiswaRequest $request)
    {
        tbl_siswa::create([
            'NIS' => $request->NIS,
            'NISN' => $request->NISN,
            'nama_siswa' => $request->nama_siswa,
            'jk_siswa' => $request->jk_siswa,
            'agama_siswa' => $request->agama_siswa,
            'ket_siswa' => $request->ket_siswa,
            'id_kelas' => $request->id_kelas
        ]);

        return redirect(route('siswa'))->with('success', 'Data Siswa telah berhasil ditambahkan!');
    }

    public function edit($NIS)
    {
        $students = tbl_siswa::where('NIS', $NIS)->get();
        $classes = tbl_kelas::get();
        // dd($students->jk_siswa);

        // if ($students->jk_siswa == 'P') {
        //     $jk_siswa = "Perempuan";
        // }
        // elseif ($students->jk_siswa == 'L') {
        //     $jk_siswa = "Laki-Laki";
        // }

        return view('pages.dashboard.data-master.siswa.edit', compact('students', 'classes'));
    }

    public function destroy($NIS)
    {
        $student = tbl_siswa::find($NIS);
        $student->delete();

        return redirect(route('siswa'))->with('success', 'Data siswa telah berhasil dihapus!');
    }
}
