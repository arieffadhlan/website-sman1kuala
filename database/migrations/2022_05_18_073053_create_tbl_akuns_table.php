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
        Schema::create('tbl_akuns', function (Blueprint $table) {
            $table->tinyIncrements('id');
            $table->string('nama');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('foto');
            $table->enum('role', ['superadmin', 'admin'])->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_akuns');
    }
};
