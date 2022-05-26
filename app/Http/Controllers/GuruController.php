<?php

namespace App\Http\Controllers;

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
            $classQuery = $teacherQuery->where(function ($query) use ($searchTeacher) {
                $query->orWhere('nip', 'like', "%$searchTeacher%")
                    ->orWhere('nama_guru', 'like', "%$searchTeacher%")
                    ->orWhere('ket_guru', 'like', "%$searchTeacher%");
            });
        }

        $teachers = $teacherQuery->latest()->paginate(10);

        return view('pages.dashboard.data-master.guru.index', compact('teachers', 'sortColumn', 'sortDirection', 'searchTeacher'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.data-master.kelas.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
