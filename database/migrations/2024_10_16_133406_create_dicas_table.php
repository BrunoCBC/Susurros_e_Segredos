<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDicasTable extends Migration
{
    public function up()
    {
        Schema::create('dicas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('segredo_id')->constrained('segredos')->onDelete('cascade');
            $table->text('dica');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('dicas');
    }
}
