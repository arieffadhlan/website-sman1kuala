<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbl_guru extends Model
{
    use HasFactory;

    protected $primaryKey = 'NIP';

    protected $fillable = [
        'NIP',
        'nama_guru',
        'id_bidangStudi',
        'gol_guru',
        'ket_guru',
    ];
}
