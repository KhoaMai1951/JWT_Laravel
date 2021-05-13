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

    // GET POSTS FOR HOME NEWSFEED
    public function getPostForHomeNewsfeed(
        int $userId,
        array $followingUserIds,
        $audienceList,
        int $skip,
        int $take,
        $keyword
)
    {
        return Post::select('id', 'user_id', 'audience', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 1000) AS short_content'))
            // where ( where(title/content = keyword) and where(user_id = following user ids) and whereIn(audience, audience list) )
            ->where(function ($query) use ($keyword, $followingUserIds, $audienceList) {
                $query->where(function ($query) use ($keyword)
                {
                    $query->where('content', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('title', 'LIKE', '%' . $keyword . '%');

                })
                    ->whereIn('user_id', $followingUserIds) //record có user id nằm trong mảng userIds
                    ->whereIn('audience', $audienceList) ; //và record có audience nằm trong mảng
            })
            // orWhere ( where(title/content = keyword) and where(user_id = current user id) and whereIn(audience, [1, 2]) )
            ->orWhere(function ($query) use ($keyword, $userId) {
                $query->where(function ($query) use ($keyword)
                {
                    $query->where('content', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('title', 'LIKE', '%' . $keyword . '%');

                })
                    ->where('user_id', '=', $userId) //record có user id nằm trong mảng userIds
                    ->whereIn('audience', [1, 2]) ;//và record có audience nằm trong mảng
            })
            ->orderBy('created_at', 'DESC')
            ->skip($skip)
            ->take($take)
            ->get();
    }

    // GET POSTS FOR GLOBAL NEWSFEED
    public function getPostForGlobalNewsfeed(
        int $userId,
        $audienceList,
        int $skip,
        int $take,
        $keyword
    ) {
        return Post::select('id', 'user_id', 'audience', 'title', 'created_at', 'like', DB::raw('SUBSTRING(content, 1, 70) AS short_content'))
            // where( where(title / content = keyword) andWhereIn(audience, audienceList) andWhere(user_id != current user id) )
            ->where(function ($query) use ($keyword, $audienceList, $userId) {
                $query->where(function ($query) use ($keyword)
                {
                    $query->where('content', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('title', 'LIKE', '%' . $keyword . '%');

                })
                    ->whereIn('audience', $audienceList) //và record có audience nằm trong mảng
                    ->where('user_id', '!=', $userId) ; //user_id != current user id
            })
            // orWhere( where(title / content = keyword) andWhereIn(audience, audienceList) andWhere(user_id != current user id) )
            ->orWhere(function ($query) use ($keyword, $audienceList, $userId) {
                $query->where(function ($query) use ($keyword)
                {
                    $query->where('content', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('title', 'LIKE', '%' . $keyword . '%');

                })
                    ->whereIn('audience', [1, 2]) //và record có audience nằm trong mảng
                    ->where('user_id', '=', $userId) ; //user_id != current user id
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
