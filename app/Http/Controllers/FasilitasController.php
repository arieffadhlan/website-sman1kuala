<?php

namespace App\Http\Controllers;

use App\Http\Requests\FasilitasRequest;
use App\Models\tbl_fasilitas;
use Illuminate\Http\Request;

class FasilitasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $facilityQuery = tbl_fasilitas::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchFacility = $request->query('sear$searchFacility');

        if ($sortColumn && $sortDirection) {
            $facilityQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchFacility) {
            $facilityQuery
                ->select('tbl_fasilitas.id', 'nama_fasilitas', 'foto_fasilitas', 'deskripsi')
                ->orWhere('nama_fasilitas', 'like', "%$searchFacility%")
                ->orWhere('foto_fasilitas', 'like', "%$searchFacility%")
                ->orWhere('deskripsi', 'like', "%$searchFacility%");
        }

        $facilities = $facilityQuery
            ->select('tbl_fasilitas.id', 'nama_fasilitas', 'deskripsi', 'foto_fasilitas')
            ->paginate(5);

        return view('pages.dashboard.data-master.fasilitas.index', compact('facilities', 'sortColumn', 'sortDirection', 'searchFacility'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $facilities = tbl_fasilitas::get();
        return view('pages.dashboard.data-master.fasilitas.create', compact('facilities'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->file('foto_fasilitas') ? $request->file('foto_fasilitas')->storeAs('public/fasilitas', $request->foto_fasilitas->getClientOriginalName()) : null;
        
        tbl_fasilitas::create([
            'nama_fasilitas' => $request->nama_fasilitas,
            'deskripsi' => $request->deskripsi,
            'foto_fasilitas' => $request->foto_fasilitas == null ? null : $request->foto_fasilitas->getClientOriginalName()
        ]);
        
        return redirect(route('fasilitas'))->with('success', 'Data Fasilitas telah berhasil ditambahkan!');
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
        $facilities = tbl_fasilitas::whereId($id)->get();
        return view('pages.dashboard.data-master.fasilitas.edit', compact('facilities'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(FasilitasRequest $request, $id)
    {
        $facilities = tbl_fasilitas::whereId($id)->first();
        $request->file('foto_fasilitas') ? $request->file('foto_fasilitas')->storeAs('public/fasilitas', $request->foto_fasilitas->getClientOriginalName()) : null;
        $facilities->update([
            'nama_fasilitas' => $request->nama_fasilitas,
            'foto_fasilitas' => $request->foto_fasilitas,
            'deskripsi' => $request->deskripsi
        ]);
        
        return redirect(route('fasilitas'))->with('success', 'Data Fasilitas telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $facilities = tbl_fasilitas::find($id);
        $facilities->delete();

        return redirect(route('fasilitas'))->with('success', 'Data fasilitas telah berhasil dihapus!');
    }
}
