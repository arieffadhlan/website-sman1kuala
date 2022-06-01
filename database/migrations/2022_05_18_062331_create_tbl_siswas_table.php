<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_siswas', function (Blueprint $table) {
            $table->char('NIS', 5);
            $table->char('NISN', 10);
            $table->string('nama_siswa', 225);
            $table->enum('jk_siswa', ['L','P']);
            $table->enum('agama_siswa', ['Islam','Kristen','Hindu','Buddha']);
            $table->enum('ket_siswa', ['Aktif','Tidak Aktif','Mengundurkan Diri','Pindah','Dikeluarkan']);
            $table->tinyInteger('id_kelas', 3);
            $table->timestamps();


            $table->foreign('id_kelas')
                ->references('id')
                ->on('tbl_kelas')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_siswas');
    }
};
