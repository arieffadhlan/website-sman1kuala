<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_siswa extends Model
{
    use HasFactory;

    protected $primaryKey = 'nis';

    protected $fillable = [
        'nis',
        'nisn',
        'nama_siswa',
        'jk_siswa',
        'agama_siswa',
        'ket_siswa',
        'id_kelas'
    ];
}
