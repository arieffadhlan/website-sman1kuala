<?php

namespace App\Http\Controllers;

use App\Http\Requests\BidangStudiRequest;
use App\Models\tbl_bidangStudi;
use Illuminate\Http\Request;

class BidangStudiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $fieldOfStudyQuery = tbl_bidangStudi::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchFieldOfStudy = $request->query('searchFieldOfStudy');

        if ($sortColumn && $sortDirection) {
            $fieldOfStudyQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchFieldOfStudy) {
            $fieldOfStudyQuery
                ->select('id', 'nama_bidangStudi')
                ->orWhere('nama_bidangStudi', 'like', "%$searchFieldOfStudy%");
        }

        $fieldsOfStudy = $fieldOfStudyQuery->paginate(10);

        return view('pages.dashboard.data-master.bidang-studi.index', compact('fieldsOfStudy', 'sortColumn', 'sortDirection', 'searchFieldOfStudy'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.data-master.bidang-studi.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BidangStudiRequest $request)
    {
        tbl_bidangStudi::create([
            'nama_bidangStudi' => $request->nama_bidangStudi,
        ]);

        return redirect(route('bidang-studi'))->with('success', 'Data Bidang Studi telah berhasil ditambahkan!');
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
        $fieldOfStudy = tbl_bidangStudi::whereId($id)->get();
        return view('pages.dashboard.data-master.bidang-studi.edit', compact('fieldOfStudy'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(BidangStudiRequest $request, $id)
    {
        $fieldOfStudy = tbl_bidangStudi::whereId($id)->first();
        $fieldOfStudy->update([
            'nama_bidangStudi' => $request->nama_bidangStudi,
        ]);

        return redirect(route('bidang-studi'))->with('success', 'Data Bidang Studi telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $fieldOfStudy = tbl_bidangStudi::find($id);
        $fieldOfStudy->delete();

        return redirect(route('bidang-studi'))->with('success', 'Data Bidang Studi telah berhasil dihapus!');
    }
}
