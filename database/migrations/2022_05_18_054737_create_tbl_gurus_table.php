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
        Schema::create('tbl_gurus', function (Blueprint $table) {
            $table->char('NIP', 18);
            $table->string('nama_guru', 225)->nullable();
            $table->tinyInteger('id_bidangStudi')->nullable();
            $table->string('gol_guru', 5)->nullable();
            $table->enum('ket_guru', ['PNS', 'GTT APBD', 'GTT Komite'])->nullable();
            $table->string('foto_guru', 225)->nullable();
            $table->timestamps();

            // $table->primary('NIP')

            $table->foreign('id_bidangStudi')
                ->references('id')
                ->on('tbl_bidang_studis')
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
        Schema::dropIfExists('tbl_gurus');
    }
};
