<?php

namespace App\Http\Controllers;

use App\Http\Requests\BeritaRequest;
use App\Models\tbl_berita;
use Illuminate\Http\Request;

class BeritaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $newsPostQuery = tbl_berita::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchNewsPost = $request->query('searchNewsPost');

        if ($sortColumn && $sortDirection) {
            $newsPostQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchNewsPost) {
            $newsPostQuery
                ->select('tbl_beritas.id', 'tbl_akuns.nama as nama_pembuat', 'tbl_beritas.foto', 'judul', 'deskripsi')
                ->orWhere('tbl_akuns.nama', 'like', "%$searchNewsPost%")
                ->orWhere('tbl_beritas.foto', 'like', "%$searchNewsPost%")
                ->orWhere('judul', 'like', "%$searchNewsPost%")
                ->orWhere('deskripsi', 'like', "%$searchNewsPost%");
        }

        $newsPosts = $newsPostQuery
            ->select('tbl_beritas.id', 'tbl_akuns.nama as nama_pembuat', 'tbl_beritas.foto', 'judul', 'deskripsi')
            ->join('tbl_akuns', 'tbl_akuns.id', '=', 'tbl_beritas.id_akun')
            ->paginate(10);

        return view('pages.dashboard.data-master.berita.index', compact('newsPosts', 'sortColumn', 'sortDirection', 'searchNewsPost'));
    }

    public function indexHomepage(Request $request)
    {
        $newsPostQuery = tbl_berita::query();
        $searchNewsPost = $request->query('searchNewsPost');

        if ($searchNewsPost) {
            $newsPostQuery
                ->select('judul', 'deskripsi')
                ->orWhere('judul', 'like', "%$searchNewsPost%")
                ->orWhere('deskripsi', 'like', "%$searchNewsPost%");
        }

        $newsPosts = $newsPostQuery
            ->select('tbl_beritas.id', 'tbl_akuns.nama as nama_pembuat', 'tbl_akuns.foto as foto_pembuat', 'tbl_beritas.foto', 'judul', 'deskripsi', 'tbl_beritas.created_at')
            ->join('tbl_akuns', 'tbl_akuns.id', '=', 'tbl_beritas.id_akun')
            ->paginate(10);

        return view('pages.homepage.berita', compact('newsPosts', 'searchNewsPost'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $newsPosts = tbl_berita::get();
        return view('pages.dashboard.data-master.berita.create', compact('newsPosts'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BeritaRequest $request)
    {
        $request->file('foto') ? $request->file('foto')->storeAs('app/public/images/berita/', $request->foto->getClientOriginalName()) : null;

        tbl_berita::create([
            'id_akun' => auth()->user()->id,
            'foto' => $request->foto->getClientOriginalName(),
            'judul' => $request->judul,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect(route('berita'))->with('success', 'Data Berita telah berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $newsPost = tbl_berita::select('tbl_beritas.id', 'tbl_akuns.nama as nama_pembuat', 'tbl_akuns.foto as foto_pembuat', 'tbl_beritas.foto', 'judul', 'deskripsi', 'tbl_beritas.created_at')
            ->join('tbl_akuns', 'tbl_akuns.id', '=', 'tbl_beritas.id_akun')
            ->first();
        return view('pages.dashboard.data-master.berita.show', compact('newsPost'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $newsPost = tbl_berita::where('id', $id)->first();
        return view('pages.dashboard.data-master.berita.edit', compact('newsPost'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function update(BeritaRequest $request, $id)
    {
        $newsPost = tbl_berita::where('id', $id)->first();

        unlink(storage_path('app/public/images/berita/' . $newsPost->foto));
        $request->file('foto') ? $request->file('foto')->storeAs('public/images/berita', $request->foto->getClientOriginalName()) : null;

        $newsPost->update([
            'id_akun' => auth()->user()->id,
            'foto' => $request->foto->getClientOriginalName(),
            'judul' => $request->judul,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect(route('berita'))->with('success', 'Data Berita telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $nip
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $newsPost = tbl_berita::find($id);
        $newsPost->delete();

        return redirect(route('berita'))->with('success', 'Data Berita telah berhasil dihapus!');
    }
}
