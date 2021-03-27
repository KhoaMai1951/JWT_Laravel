<?php


namespace App\Http\Controllers;


use App\Http\Models\Tag;
use Illuminate\Support\Facades\Response;

class TagController extends Controller
{
    public function test()
    {
        $tag = Tag::find(1);
        $tagType = $tag->tagType;
        return Response::json([
            'tag' => $tag,
            'tag_type' => $tagType,
        ], 200);
    }
}
