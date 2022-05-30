<?php

namespace App\Http\Controllers;

use App\Http\Requests\GuruRequest;
use App\Models\tbl_bidangStudi;
use App\Models\tbl_guru;
use Illuminate\Http\Request;

class GuruController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $teacherQuery = tbl_guru::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchTeacher = $request->query('searchTeacher');

        if ($sortColumn && $sortDirection) {
            $teacherQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchTeacher) {
            $teacherQuery
                ->select('nip', 'nama_guru', 'tbl_bidang_studis.nama_bidangStudi', 'gol_guru', 'ket_guru')
                ->orWhere('nip', 'like', "%$searchTeacher%")
                ->orWhere('nama_guru', 'like', "%$searchTeacher%")
                ->orWhere('tbl_bidang_studis.nama_bidangStudi', 'like', "%$searchTeacher%")
                ->orWhere('gol_guru', 'like', "%$searchTeacher%")
                ->orWhere('ket_guru', 'like', "%$searchTeacher%");
        }

        $teachers = $teacherQuery
            ->select('nip', 'nama_guru', 'tbl_bidang_studis.nama_bidangStudi', 'gol_guru', 'ket_guru')
            ->join('tbl_bidang_studis', 'tbl_bidang_studis.id', '=', 'tbl_gurus.id_bidangStudi')
            ->paginate(10);

        return view('pages.dashboard.data-master.guru.index', compact('teachers', 'sortColumn', 'sortDirection', 'searchTeacher'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $fieldsOfStudy = tbl_bidangStudi::get();
        return view('pages.dashboard.data-master.guru.create', compact('fieldsOfStudy'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(GuruRequest $request)
    {
        tbl_guru::create([
            'nip' => $request->nip,
            'nama_guru' => $request->nama_guru,
            'id_bidangStudi' => $request->bidang_studi,
            'gol_guru' => $request->golongan_guru,
            'ket_guru' => $request->keterangan_guru
        ]);

        return redirect(route('guru'))->with('success', 'Data guru telah berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function show($nip)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function edit($nip)
    {
        $teacher = tbl_guru::where('NIP', $nip)->first();
        $fieldsOfStudy = tbl_bidangStudi::get();
        return view('pages.dashboard.data-master.guru.edit', compact('teacher', 'fieldsOfStudy'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $nip)
    {
        $teacher = tbl_guru::where('NIP', $nip)->first();
        $teacher->update([
            'NIP' => $request->nip,
            'nama_guru' => $request->nama_guru,
            'id_bidangStudi' => $request->bidang_studi,
            'gol_guru' => $request->golongan_guru,
            'ket_guru' => $request->keterangan_guru
        ]);

        return redirect(route('guru'))->with('success', 'Data guru telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function destroy($nip)
    {
        $teacher = tbl_guru::find($nip);
        $teacher->delete();

        return redirect(route('guru'))->with('success', 'Data guru telah berhasil dihapus!');
    }
}
