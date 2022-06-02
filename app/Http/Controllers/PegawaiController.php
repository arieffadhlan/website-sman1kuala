<?php

namespace App\Http\Controllers;

use App\Http\Requests\PegawaiRequest;
use App\Models\tbl_pegawai;
use Illuminate\Http\Request;

class PegawaiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $staffQuery = tbl_pegawai::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchStaff = $request->query('searchStaff');

        if ($sortColumn && $sortDirection) {
            $staffQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchStaff) {
            $staffQuery
                ->select('id', 'nama_pegawai', 'ket_pegawai')
                ->orWhere('id', 'like', "%$searchStaff%")
                ->orWhere('nama_pegawai', 'like', "%$searchStaff%")
                ->orWhere('ket_pagawai', 'like', "%$searchStaff%");
        }

        $staffs = $staffQuery
            ->select('id', 'nama_pegawai', 'ket_pegawai')
            ->paginate(10);

        return view('pages.dashboard.data-master.pegawai.index', compact('staffs', 'sortColumn', 'sortDirection', 'searchStaff'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $staffs = tbl_pegawai::get();
        return view('pages.dashboard.data-master.pegawai.create', compact('staffs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PegawaiRequest $request)
    {
        tbl_pegawai::create([
            'nama_pegawai' => $request->nama_pegawai,
            'ket_pegawai' => $request->ket_pegawai
        ]);

        return redirect(route('pegawai'))->with('success', 'Data pegawai telah berhasil ditambahkan!');
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
        $staffs = tbl_pegawai::whereId($id)->get();
        return view('pages.dashboard.data-master.pegawai.edit', compact('staffs'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PegawaiRequest $request, $id)
    {
        $stafss = tbl_pegawai::whereId($id)->first();
        $stafss->update([
            'nama_pegawai' => $request->nama_pegawai,
            'ket_pegawai' => $request->ket_pegawai
        ]);

        return redirect(route('pegawai'))->with('success', 'Data pegawai telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $staffs = tbl_pegawai::find($id);
        $staffs->delete();

        return redirect(route('pegawai'))->with('success', 'Data pegawai telah berhasil dihapus!');
    }
}
