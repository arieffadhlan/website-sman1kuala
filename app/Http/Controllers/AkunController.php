<?php

namespace App\Http\Controllers;

use App\Http\Requests\AkunRequest;
use App\Models\User;
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
        $userQuery = User::query();
        $sortColumn = $request->query('sortColumn');
        $sortDirection = $request->query('sortDirection');
        $searchAccount = $request->query('searchAccount');

        if ($sortColumn && $sortDirection) {
            $userQuery->orderBy($sortColumn, $sortDirection ?: 'asc');
        }

        if ($searchAccount) {
            $userQuery = $userQuery->where(function ($query) use ($searchAccount) {
                $query->orWhere('name', 'like', "%$searchAccount%")
                    ->orWhere('email', 'like', "%$searchAccount%");
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
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
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
        $account = User::whereId($id)->get();
        return view('pages.dashboard.data-master.akun.edit', compact('account'));
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
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
        ]);

        $account = User::whereId($id)->first();
        $account->update([
            'name' => $request->name,
            'email' => $request->email,
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
        $account = User::find($id);
        $account->delete();

        return redirect(route('akun'))->with('success', 'Data Akun telah berhasil dihapus!');
    }
}
