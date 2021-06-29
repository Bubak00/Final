<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransfersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transfers_', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sender_user_id')->constrained('users', 'id');
            $table->foreignId('recipient_user_id')->constrained('users', 'id');
            $table->integer('amount');
            $table->integer('commission_amount');

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
        Schema::dropIfExists('transfers_');
    }
}
