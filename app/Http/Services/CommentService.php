<?php


namespace App\Http\Services;


use Illuminate\Support\Facades\DB;

class CommentService
{
    // GET NUMBER OF COMMENTS FOR A POST
    public function getNumberOfComments(int $postId)
    {
        return count(DB::table('comment')
            ->select('id')
            ->where('post_id', '=', $postId)
            ->get());
    }

    // CHECK LIKE COMMENT
    public function checkLikedComment($commentId, $userId){
        return !DB::table('liked_comment')
            ->select('comment_id', 'user_id')
            ->where('comment_id', '=', $commentId)
            ->where('user_id', '=', $userId)
            ->get()
            ->isEmpty();
    }

    // GET COMMENTS BY CHUNK BY POST ID
    public function getCommentsByChunkByPostId($postId, $skip, $take){
        return DB::table('comment')
            ->select('user_id', 'post_id', 'content', 'id', 'image_url', 'like', 'created_at')
            ->where('post_id', '=', $postId)
            ->orderBy('created_at', 'DESC')
            ->skip($skip)->take($take)
            ->get();
    }
}
