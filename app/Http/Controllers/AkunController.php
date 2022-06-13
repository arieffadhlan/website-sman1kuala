<?php

namespace App\Http\Controllers;

use App\Http\Requests\AkunRequest;
use App\Models\tbl_akun;
use Illuminate\Http\Request;

class AkunController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $userQuery = tbl_akun::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchAccount = $request->query('searchAccount');

        if ($sortColumn && $sortDirection) {
            $userQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchAccount) {
            $userQuery = $userQuery->where(function ($query) use ($searchAccount) {
                $query->orWhere('nama', 'like', "%$searchAccount%")
                    ->orWhere('email', 'like', "%$searchAccount%")
                    ->orWhere('role', 'like', "%$searchAccount%");
            });
        }

        $accounts = $userQuery
            ->latest()
            ->paginate(10);

        return view('pages.dashboard.data-master.akun.index', compact('accounts', 'sortColumn', 'sortDirection', 'searchAccount'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.dashboard.data-master.akun.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AkunRequest $request)
    {
        tbl_akun::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => $request->role
        ]);

        return redirect(route('akun'))->with('success', 'Data Akun telah berhasil ditambahkan!');
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
        $account = tbl_akun::whereId($id)->get();
        return view('pages.dashboard.data-master.akun.edit', compact('account'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AkunRequest $request, $id)
    {
        $account = tbl_akun::whereId($id)->first();
        $account->update([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => $request->role
        ]);

        return redirect(route('akun'))->with('success', 'Data Akun telah berhasil di-update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $account = tbl_akun::find($id);
        $account->delete();

        return redirect(route('akun'))->with('success', 'Data Akun telah berhasil dihapus!');
    }
}
