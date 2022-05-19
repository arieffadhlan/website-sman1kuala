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
            $table->unsignedBigInteger('id');
            $table->Biginteger('NIP', 16);
            $table->text('nama_guru', 225)->nullable();
            $table->unsignedBigInteger('id_bidangStudi')->nullable();
            $table->text('gol_guru', 225)->nullable();
            $table->text('ket_guru', 225)->nullable();
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
