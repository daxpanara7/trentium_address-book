<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $fillable = [
        'slug',
        'action',
        'data',
    ];

    protected $casts = [
        'data' => 'array',
    ];
}
