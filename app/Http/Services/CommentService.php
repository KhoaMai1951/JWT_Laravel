<?php


namespace App\Http\Services;


use Illuminate\Support\Facades\DB;

class CommentService
{
    public function getNumberOfComments(int $postId)
    {
        return count(DB::table('comment')
            ->select('id')
            ->where('post_id', '=', $postId)
            ->get());
    }
}
