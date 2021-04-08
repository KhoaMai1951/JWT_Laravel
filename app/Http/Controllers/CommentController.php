<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;


class CommentController extends Controller
{

    public function getAllCommentsByPostId(Request $request)
    {
        $comments = DB::table('comment')
            ->select('user_id', 'post_id', 'content', 'id')
            ->where('post_id', '=', $request->get('post_id'))
            ->get();

        foreach ($comments as $comment)
        {
            $username = DB::table('user')
                ->select('username')
                ->where('id', '=', $comment->user_id)
                ->first();
            $comment->username = $username->username;
        }
        return Response::json([
            'comments' => $comments,
        ], 200);
    }
}
