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
            'nis' => $request->nis,
            'nisn' => $request->nisn,
            'nama_siswa' => $request->nama_siswa,
            'jk_siswa' => $request->jk_siswa,
            'agama_siswa' => $request->agama_siswa,
            'ket_siswa' => $request->ket_siswa,
            'id_kelas' => $request->id_kelas
        ]);

        return redirect(route('siswa'))->with('success', 'Data Siswa telah berhasil ditambahkan!');
    }

    public function edit($nis)
    {
        $students = tbl_siswa::where('nis', $nis)->get();
        $classes = tbl_kelas::get();

        return view('pages.dashboard.data-master.siswa.edit', compact('students', 'classes'));
    }

    public function update(SiswaRequest $request, $nis)
    {
        $siswa = tbl_siswa::where('nis', $nis)->first();
        $siswa->update([
            'nis' => $request->nis,
            'nisn' => $request->nisn,
            'nama_siswa' => $request->nama_siswa,
            'jk_siswa' => $request->jk_siswa,
            'agama_siswa' => $request->agama_siswa,
            'ket_siswa' => $request->ket_siswa,
            'id_kelas' => $request->id_kelas
        ]);

        return redirect(route('siswa'))->with('success', 'Data Siswa telah berhasil di-update!');
    }

    public function destroy($nis)
    {
        $student = tbl_siswa::find($nis);
        $student->delete();

        return redirect(route('siswa'))->with('success', 'Data siswa telah berhasil dihapus!');
    }
}
