<?php


namespace App\Http\Models;


use Illuminate\Database\Eloquent\Model;

class PendingExpert extends Model
{
    protected $table = 'pending_expert';

    protected $fillable  = [
        'bio',
        'experience_in',
        'user_id'
    ];

    public function imagesForPendingExpert(){
        return $this->hasMany(ImageForPendingExpert::class);
    }
}
