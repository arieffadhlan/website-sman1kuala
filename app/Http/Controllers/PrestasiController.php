<?php

namespace App\Http\Controllers;

use App\Http\Requests\PrestasiRequest;
use App\Models\tbl_prestasi;
use Illuminate\Http\Request;

class PrestasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $achievementQuery = tbl_prestasi::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchAchievement = $request->query('searchAchievement');

        if ($sortColumn && $sortDirection) {
            $achievementQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchAchievement) {
            $achievementQuery = $achievementQuery->where(function ($query) use ($searchAchievement) {
                $query->orWhere('nama_prestasi', 'like', "%$searchAchievement%")
                    ->orWhere('deskripsi', 'like', "%$searchAchievement%");
            });
        }

        $achievements = $achievementQuery
            ->latest()
            ->paginate(10);

        return view('pages.dashboard.data-master.prestasi.index', compact('achievements', 'sortColumn', 'sortDirection', 'searchAchievement'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.data-master.prestasi.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PrestasiRequest $request)
    {
        tbl_prestasi::create([
            'nama_prestasi' => $request->nama_prestasi,
            'deskripsi' => $request->deskripsi
        ]);

        return redirect(route('prestasi'))->with('success', 'Data Prestasi telah berhasil ditambahkan!');
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
        $achievement = tbl_prestasi::whereId($id)->get();
        return view('pages.dashboard.data-master.prestasi.edit', compact('achievement'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PrestasiRequest $request, $id)
    {
        $achievement = tbl_prestasi::whereId($id)->first();
        $achievement->update([
            'nama_prestasi' => $request->nama_prestasi,
            'deskripsi' => $request->deskripsi
        ]);

        return redirect(route('prestasi'))->with('success', 'Data Prestasi telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $achievement = tbl_prestasi::find($id);
        $achievement->delete();

        return redirect(route('prestasi'))->with('success', 'Data Prestasi telah berhasil dihapus!');
    }
}
