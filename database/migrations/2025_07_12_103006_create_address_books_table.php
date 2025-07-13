<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('address_books', function (Blueprint $table) {
            $table->uuid('slug')->primary();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('profile_pic');
            $table->string('email')->unique();
            $table->string('phone', 10);
            $table->string('street');
            $table->string('zip_code');
            $table->foreignId('city_id')->constrained()->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('address_books');
    }
};
