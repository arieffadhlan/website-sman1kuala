<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_kelas extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama',
        'wali_kelas'
    ];
}
