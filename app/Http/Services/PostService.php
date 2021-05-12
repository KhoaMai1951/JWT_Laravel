<?php

namespace App\Http\Services;

use App\Http\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PostService
{
    // LẤY BÀI VIẾT THEO ID
    public function getPost($id) {
        return Post::find($id);
    }

    // LẤY DS BÀI VIẾT CỦA USER CHO TRANG PROFILE THEO CỤM
    public function getAllPostsByChunkByUserId(int $userId, int $skip, int $take)
    {
        return Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->where('user_id', '=', $userId)
            ->orderBy('created_at', 'DESC')
            ->skip($skip)
            ->take($take)
            ->get();
    }

    // KIỂM TRA ĐÃ LIKE POST HAY CHƯA
    public function checkLikedPost($userId, $postId)
    {
        $result = DB::table('liked_post')
            ->select('post_id', 'user_id')
            ->where('user_id', '=', $userId)
            ->where('post_id', '=', $postId)
            ->get();
        return !$result->isEmpty();
    }

    // LẤY DS ID CỦA CÁC POST ĐƯỢC SAVE TỪ USER ID
    public function getSavedPostIdsFromUserId(int $userId)
    {
        $postIdsResult = DB::table('saved_post')
            ->select('post_id')
            ->where('user_id', '=', $userId)
            ->get();
        $postIds = [];
        foreach ($postIdsResult as $value) {
            array_push($postIds, $value->post_id);
        }
        return $postIds;
    }

    // LẤY DS POST THEO CỤM TỪ DS ID CỦA CÁC POST
    public function getSavedPostFromIdsArray($postIds, int $skip, int $take){
        return Post::select('id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            ->whereIn('id', $postIds)
            ->orderBy('created_at', 'DESC')
            ->skip($skip)
            ->take($take)
            ->get();
    }

    // LẤY DS POST THEO MẢNG USER ID THEO CỤM DÀNH CHO USER THƯỜNG
    public function getPostsByUsersIdsArrayByChunk(
        int $userId,
        array $followingUserIds,
        int $skip,
        int $take,
        $keyword
)
    {
//       return Post::select('id', 'user_id', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
//           //Lấy toàn bộ record có title hoặc content theo keyword
//        ->where(function ($query) use ($keyword) {
//            $query->where('content', 'LIKE', '%' . $keyword . '%')
//                ->orWhere('title', 'LIKE', '%' . $keyword . '%');
//
//        })
//            ->whereIn('user_id', $followingUserIds) //record có user id nằm trong mảng userIds
//            ->whereIn('audience', [1, 2]) //và record có audience nằm trong mảng
//            ->orderBy('created_at', 'DESC')
//            ->skip($skip)
//            ->take($take)
//            ->get();

        return Post::select('id', 'user_id', 'audience', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            //Lấy toàn bộ record có title hoặc content theo keyword
            ->where(function ($query) use ($keyword) {
                $query->where('content', 'LIKE', '%' . $keyword . '%')
                    ->orWhere('title', 'LIKE', '%' . $keyword . '%');

            })
            //Lấy toàn bộ record của user đang theo dõi có giới hạn theo dõi là toàn bộ role
            ->where(function ($query) use ($followingUserIds) {
                $query->whereIn('user_id', $followingUserIds) //record có user id nằm trong mảng userIds
                ->whereIn('audience', [1]) ;//và record có audience nằm trong mảng
            })
            //Lấy toàn bộ record của chính user có giới hạn theo dõi là toàn bộ role + chỉ expert
            ->orWhere(function ($query) use ($userId) {
                $query->where('user_id', '=', $userId) //record có user id nằm trong mảng userIds
                ->whereIn('audience', [1, 2]) ;//và record có audience nằm trong mảng
            })
            ->orderBy('created_at', 'DESC')
            ->skip($skip)
            ->take($take)
            ->get();
    }

    // KIỂM TRA ĐÃ LƯU BÀI VIẾT
    public function checkSavePost(int $userId, int $postId)
    {
        $getRecord = DB::table('saved_post')
            ->where('user_id', '=', $userId)
            ->where('post_id', '=', $postId)
            ->get();
        return !$getRecord->isEmpty();
    }

    // LƯU BÀI VIẾT
    public function savePost($userId, $postId)
    {
        DB::table('saved_post')
            ->insert([
                'user_id' => $userId,
                'post_id' => $postId,
            ]);
    }

    // BỎ LƯU BÀI VIẾT
    public function unsavePost($userId, $postId)
    {
        $getRecord = DB::table('saved_post')
            ->where('user_id', '=', $userId)
            ->where('post_id', '=', $postId)
            ->delete();
    }
}
