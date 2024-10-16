<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTentativasTable extends Migration
{
    public function up()
    {
        Schema::create('tentativas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('segredo_id')->constrained('segredos')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->integer('total_tentativas')->default(0);
            $table->integer('dicas_utilizadas')->default(0);
            $table->enum('resultado', ['certo', 'errado'])->default('errado');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tentativas');
    }
}

