<?php

namespace App\Http\Controllers;

use App\Http\Requests\EkstrakurikulerRequest;
use App\Models\tbl_ekstrakurikuler;
use Illuminate\Http\Request;

class EkstrakurikulerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $extracurricularQuery = tbl_ekstrakurikuler::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchExtracurricular = $request->query('searchExtracurricular');

        if ($sortColumn && $sortDirection) {
            $extracurricularQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchExtracurricular) {
            $extracurricularQuery = $extracurricularQuery->where(function ($query) use ($searchExtracurricular) {
                $query->orWhere('nama_ekstrakurikuler', 'like', "%$searchExtracurricular%");
            });
        }

        $extracurriculars = $extracurricularQuery->paginate(10);

        return view('pages.dashboard.data-master.ekstrakurikuler.index', compact('extracurriculars', 'sortColumn', 'sortDirection', 'searchExtracurricular'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.data-master.ekstrakurikuler.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EkstrakurikulerRequest $request)
    {
        $request->file('ikon') ? $request->file('ikon')->storeAs('public/icons', $request->ikon->getClientOriginalName()) : null;

        tbl_ekstrakurikuler::create([
            'nama_ekstrakurikuler' => $request->nama_ekstrakurikuler,
            'ikon' => $request->ikon == null ? null : $request->ikon->getClientOriginalName()
        ]);

        return redirect(route('ekstrakurikuler'))->with('success', 'Data Ekstrakurikuler telah berhasil ditambahkan!');
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
        $extracurricular = tbl_ekstrakurikuler::whereId($id)->get();
        return view('pages.dashboard.data-master.ekstrakurikuler.edit', compact('extracurricular'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EkstrakurikulerRequest $request, $id)
    {
        $extracurricular = tbl_ekstrakurikuler::whereId($id)->first();
        $request->file('ikon') ? $request->file('ikon')->storeAs('public/icons', $request->ikon->getClientOriginalName()) : null;
        $extracurricular->update([
            'nama_ekstrakurikuler' => $request->nama_ekstrakurikuler,
            'ikon' => $request->ikon
        ]);

        return redirect(route('ekstrakurikuler'))->with('success', 'Data Ekstrakurikuler telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $extracurricular = tbl_ekstrakurikuler::find($id);
        $extracurricular->delete();

        return redirect(route('ekstrakurikuler'))->with('success', 'Data Ekstrakurikuler telah berhasil dihapus!');
    }
}
