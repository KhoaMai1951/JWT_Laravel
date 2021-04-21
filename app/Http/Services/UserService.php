<?php


namespace App\Http\Services;


use App\Http\Models\UserFollowUser;
use Illuminate\Http\Request;

class UserService
{
    // GET IDS OF FOLLOWING USER
    public function getIdsOfFollowingUser(int $userId) {
        // GET RESULT FROM QUERY GET IDS OF FOLLOWING USER
        $queryFollowingUsersIds = UserFollowUser::select('user_id')
            ->where('follower_user_id', '=', $userId)
            ->get();
        // CREATE AN ARRAY TO STORE THE IDS
        $followingUsersIds = [];
        // PUSH THE CURRENT USER ID TO THE ARRAY
        array_push($followingUsersIds, $userId);
        // PUSH ALL THE FOLLOWING USER IDS TO THE ARRAY
        foreach ($queryFollowingUsersIds as $followingUsersId) {
            array_push($followingUsersIds, $followingUsersId->user_id);
        }
        return $followingUsersIds;
    }
}
