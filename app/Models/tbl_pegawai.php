<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_pegawai extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_pegawai',
        'ket_pegawai'
    ];
}
