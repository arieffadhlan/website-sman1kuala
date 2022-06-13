<?php

namespace App\Http\Controllers;

use App\Http\Requests\AkunRequest;
use App\Models\tbl_akun;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;

class ProfileController extends Controller
{
    public function index()
    {
        $account = tbl_akun::whereNama(auth()->user()->nama)->get();
        return view('pages.dashboard.akun.index', compact('account'));
    }

    public function update(Request $request, tbl_akun $user)
    {
        $request->validate([
            'nama' => ['string', 'max:255'],
            'email' => ['string', 'string', 'email:rfc,dns', 'max:255'],
            'password' => ['confirmed', Password::defaults()],
            'foto' => ['image', 'max:2048']
        ]);

        $currentUserName = auth()->user()->nama;
        $currentUserPhoto = auth()->user()->foto;

        if ($request->file('foto') != null) {
            if (isset($currentUserPhoto)) {
                if ($currentUserPhoto != 'user.png') {
                    unlink(storage_path('app/public/images/akun/' . $currentUserPhoto));
                }

                $request->file('foto')->storeAs('public/images/akun/', $request->foto->getClientOriginalName());
                $user->whereNama($currentUserName)->update([
                    'foto' => $request->foto->getClientOriginalName()
                ]);
            } else {
                $request->file('foto')->storeAs('public/images/akun/', $request->foto->getClientOriginalName());
                $user->whereNama($currentUserName)->update([
                    'foto' => $request->foto->getClientOriginalName()
                ]);
            }
        } else if ($request->nama != null) {
            $user->whereNama($currentUserName)->update([
                'nama' => $request->nama,
                'email' => $request->email
            ]);
        } else {
            $user->whereNama($currentUserName)->update([
                'password' => bcrypt($request->password)
            ]);
        }

        return redirect(route('akun-saya'))->with('success', 'Data akun Anda telah berhasil di-update!');
    }
}
