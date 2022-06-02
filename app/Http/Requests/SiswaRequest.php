<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SiswaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nis' => ['required', 'string', 'max:5'],
            'nisn' => ['required', 'string', 'max:10'],
            'nama_siswa' => ['required', 'string'],
            'jk_siswa' => ['required', 'string'],
            'agama_siswa' => ['required', 'string'],
            'id_kelas' => ['required', 'int'],
            'ket_siswa' => ['required', 'string']
        ];
    }
}
