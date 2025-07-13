<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\City;

class AddressBook extends Model
{
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'phone',
        'street',
        'zip_code',
        'city_id',
        'profile_pic',
        'slug',
    ];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    protected $primaryKey = 'slug';
    public $incrementing = false;
    protected $keyType = 'string';

}
