<?php

namespace App\Http\Models;


use App\User;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $table = 'tag';

    public function tagType()
    {
        return $this->belongsTo(TagType::class, 'tag_type_id', 'id');
    }

    public function posts()
    {
        //return $this->belongsToMany(Post::class, 'post_tag', 'post_id','tag_id');
        return $this->belongsToMany(Post::class, 'post_tag', 'tag_id','post_id');
    }
}
