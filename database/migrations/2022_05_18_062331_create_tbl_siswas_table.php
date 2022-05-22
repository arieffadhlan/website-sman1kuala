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
            $table->unsignedBigInteger('id');
            $table->Biginteger('NIS', 5);
            $table->unsignedBigInteger('NISN')->nullable();
            $table->text('nama_siswa', 225)->nullable();
            $table->enum('jk_siswa', ['L','P'])->nullable();
            $table->enum('agama_siswa', ['Islam','Kristen','Hindu','Buddha'])->nullable();
            $table->text('ket_siswa')->nullable();
            $table->unsignedBigInteger('id_kelas')->nullable();
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
