<?php

namespace App\Http\Controllers;

use App\Models\tbl_kelas;
use Illuminate\Http\Request;

class ClassController extends Controller
{
    public function index()
    {
        $classes = tbl_kelas::paginate(10);

        return view('pages.dashboard.data-master.kelas', compact('classes'));
    }
}
