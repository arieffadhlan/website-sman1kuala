<?php

namespace App\Http\Controllers;

use App\Models\tbl_guru;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function index()
    {
        $teachers = tbl_guru::paginate(10);

        return view('pages.dashboard.data-master.guru', compact('teachers'));
    }
}
