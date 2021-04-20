<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;


class CommentController extends Controller
{

    public function getCommentsByChunkByPostId(Request $request)
    {
        $comments = DB::table('comment')
            ->select('user_id', 'post_id', 'content', 'id', 'created_at')
            ->where('post_id', '=', $request->get('post_id'))
            ->orderBy('created_at', 'DESC')
            ->skip($request->get('skip'))->take($request->get('take'))
            ->get();

        foreach ($comments as $comment) {
            $username = DB::table('user')
                ->select('username')
                ->where('id', '=', $comment->user_id)
                ->first();
            $comment->username = $username->username;
            // HANDLE AVATAR
            $avatarLink = DB::table('image_for_user')
                ->select('url')
                ->where('user_id', '=', $comment->user_id)
                ->first();
            $comment->avatar_link =  asset($avatarLink->url);
        }
        return Response::json([
            'comments' => $comments,
        ], 200);
    }

    public function getAllCommentsByPostId(Request $request)
    {
        $comments = DB::table('comment')
            ->select('user_id', 'post_id', 'content', 'id', 'created_at')
            ->where('post_id', '=', $request->get('post_id'))
            ->orderBy('created_at', 'DESC')
            ->get();


        foreach ($comments as $comment) {
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

    public function getNumberOfCommentsByPostId(Request $request)
    {
        $comments = DB::table('comment')
            ->select('user_id', 'post_id', 'content', 'id')
            ->where('post_id', '=', $request->get('post_id'))
            ->count();

        return Response::json([
            'comments' => $comments,
        ], 200);
    }

    public function submitComment(Request $request)
    {
        $postId = $request->get('post_id');
        $userId = $request->get('user_id');
        $content = $request->get('content');

        $comment = new Comment();
        $comment->post_id = $postId;
        $comment->user_id = $userId;
        $comment->content = $content;
        $comment->save();

        return Response::json([
            'comments' => $comment,
        ], 200);
    }
}
