<?php


namespace App\Http\Controllers;


use App\Http\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class TagController extends Controller
{
    public function getAllTags()
    {
        return Tag::select('id', 'name')->get();
    }

    public function getAllTagsByTypeId(Request $request)
    {
        return Tag::select('id', 'name')
            ->where('tag_type_id', '=', $request->get('tag_type_id'))
            ->get();
    }
}
