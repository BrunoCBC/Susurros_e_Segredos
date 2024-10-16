<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSegredosTable extends Migration
{
    public function up()
    {
        Schema::create('segredos', function (Blueprint $table) {
            $table->id();
            $table->text('conteudo');
            $table->integer('tentativas_disponiveis')->nullable(); // NULL para tentativas infinitas
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('segredos');
    }
}
