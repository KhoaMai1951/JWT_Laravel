<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class ImageForPost extends Model
{
    protected $table = 'image_for_post';

    public $timestamps = false;

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id', 'id');
    }
}
