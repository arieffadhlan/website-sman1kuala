<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_fasilitas extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_fasilitas',
        'foto_fasilitas',
        'deskripsi'
    ];
}
