<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_berita extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_akun',
        'foto',
        'judul',
        'deskripsi'
    ];
}
