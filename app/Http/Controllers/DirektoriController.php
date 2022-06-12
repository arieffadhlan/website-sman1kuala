<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class DirektoriController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchStudent = $request->query('searchStudent');

        if ($sortColumn && $sortDirection) {
            $students = $this->paginate(DB::select('SELECT * FROM direktori_siswa ORDER BY ' . $sortColumn . ' ' . $sortDirection ?: 'asc'), 10, null, ['path' => 'direktori']);
        } else {
            if ($searchStudent) {
                $students =  $this->paginate(collect(
                    DB::select(
                        "SELECT * FROM direktori_siswa WHERE nis LIKE '%" . $searchStudent . "%'" .
                            " OR nama_siswa LIKE '%" . $searchStudent . "%'" .
                            " OR jk_siswa LIKE '%" . $searchStudent . "%'" .
                            " OR agama_siswa LIKE '%" . $searchStudent . "%'" .
                            " OR kelas LIKE '%" . $searchStudent . "%'" .
                            " OR wali_kelas LIKE '%" . $searchStudent . "%'"
                    )
                ), 10, null, ['path' => 'direktori']);
            } else {
                $students = $this->paginate(DB::select('SELECT * FROM direktori_siswa'), 10, null, ['path' => 'direktori']);
            }
        }

        return view('pages.homepage.direktori', compact('students', 'sortColumn', 'sortDirection', 'searchStudent'));
    }

    public function paginate($items, $perPage = 5, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
}
