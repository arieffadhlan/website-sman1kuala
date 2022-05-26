<?php

namespace App\Http\Controllers;

use App\Http\Requests\KelasRequest;
use App\Models\tbl_guru;
use App\Models\tbl_kelas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KelasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $classQuery = tbl_kelas::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchClass = $request->query('searchClass');

        if ($sortColumn && $sortDirection) {
            $classQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchClass) {
            $classQuery = $classQuery->where(function ($query) use ($searchClass) {
                $query->orWhere('nama', 'like', "%$searchClass%")
                    ->orWhere('wali_kelas', 'like', "%$searchClass%");
            });
        }

        // $classes = $classQuery->join('tbl_gurus', 'tbl_gurus.NIP', '=', 'tbl_kelas.wali_kelas')
        //     ->get();
        // dd($classQuery);
        $classes = $classQuery->latest()->paginate(10);

        return view('pages.dashboard.data-master.kelas.index', compact('classes', 'sortColumn', 'sortDirection', 'searchClass'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $teachers = tbl_guru::get();
        return view('pages.dashboard.data-master.kelas.create', compact('teachers'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(KelasRequest $request)
    {
        tbl_kelas::create([
            'nama' => $request->nama,
            'wali_kelas' => $request->wali_kelas
        ]);

        return redirect(route('kelas'))->with('success', 'Data Kelas telah berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $class = tbl_kelas::whereId($id)->get();
        $teachers = tbl_guru::get();
        return view('pages.dashboard.data-master.kelas.edit', compact('class', 'teachers'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(KelasRequest $request, $id)
    {
        $class = tbl_kelas::whereId($id)->first();
        $class->update([
            'nama' => $request->nama,
            'wali_kelas' => $request->wali_kelas
        ]);

        return redirect(route('kelas'))->with('success', 'Data Kelas telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $class = tbl_kelas::find($id);
        $class->delete();

        return redirect(route('kelas'))->with('success', 'Data Kelas telah berhasil dihapus!');
    }
}
