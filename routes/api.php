<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'], function () {

    // USER AUTHENTICATE SYSTEM
    Route::post('/login', 'UserController@login');
    Route::post('/register', 'UserController@register');
    Route::post('/activate_account', 'UserController@activateAccount');
    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('/logout', 'UserController@logout');
        Route::get('/get_data_with_token', 'UserController@getData');
    });
    Route::get('/get_data', 'UserController@getData');
    Route::get('/testme', function (Request $request) {
        dd($request->header());
    });
    // USER
    Route::group(['prefix' => '/user'], function () {
        Route::get('/get_user_info_by_id', 'UserController@getUserInfoById');
        Route::post('/check_follow', 'UserController@checkFollow');
        Route::post('/follow_user', 'UserController@followUser');
        Route::post('/upload_avatar', 'UserController@uploadAvatar');
        Route::post('/update_info', 'UserController@updateInfo');
        Route::post('/change_password', 'UserController@changePassword');
    });

    // POST
    Route::group(['prefix' => '/post'], function () {

        Route::post('/test_dio', 'PostController@testDio');
        // LẤY CHI TIẾT BÀI VIẾT THEO ID
        Route::get('/get_post', 'PostController@getPostById');
        Route::post('/get_post', 'PostController@getPostById');

        Route::group(['middleware' => 'auth:api'], function () {
            Route::post('/submit_post', 'PostController@submitPost');
        });

        Route::post('/upload_image', 'PostController@uploadImageToStorage');
        // LẤY DS BÀI VIẾT CỦA USER CHO TRANG PROFILE THEO CỤM
        Route::post('/get_all_posts_by_chunk_by_user_id', 'PostController@getAllPostsByChunkByUserId');
        Route::get('/get_all_posts_by_chunk_by_user_id', 'PostController@getAllPostsByChunkByUserId');
        // LẤY DS BÀI VIẾT USER ĐÃ SAVE CHO TRANG PROFILE THEO CỤM
        Route::post('/get_all_saved_posts_by_chunk_by_user_id', 'PostController@getAllSavedPostsByChunkByUserId');
        // LẤY DS BÀI VIẾT THEO CỤM cho trang newsfeed
        Route::post('/get_all_posts_by_chunk', 'PostController@getAllPostsByChunk');
        Route::get('/get_all_posts_by_chunk', 'PostController@getAllPostsByChunk');
        Route::post('/get_all_posts_of_following_users_by_chunk_by_user_id', 'PostController@getAllPostsOfFollowingUsersByChunkByUserId');
        Route::get('/like_post', 'PostController@likePost');
        Route::get('/check_like_post', 'PostController@checkLikePostOrNot');
        // LẤY DS BÀI VIẾT CHO TRANG DISCOVER
        Route::post('/test_search', 'PostController@testSearch');
        Route::get('/test_search', 'PostController@testSearch');
        // LƯU BÀI VIẾT
        Route::post('/save_post', 'PostController@savePost');
        // BỎ LƯU BÀI VIẾT
        Route::post('/unsave_post', 'PostController@unSavePost');
        // KIỂM TRA ĐÃ LƯU BÀI VIẾT
        Route::post('/check_save_post', 'PostController@checkSavePost');
        // SỬA BÀI VIẾT
        Route::post('/edit_post', 'PostController@editPost');
    });

    // TAG
    Route::group(['prefix' => '/tag'], function () {
        Route::get('/get_all_tags', 'TagController@getAllTags');
        Route::get('/get_all_tags_by_type_id', 'TagController@getAllTagsByTypeId');
    });

    // COMMENT
    Route::group(['prefix' => '/comment'], function () {
        Route::get('/get_all_comments_by_post_id', 'CommentController@getAllCommentsByPostId');
        Route::get('/get_number_of_comments_by_post_id', 'CommentController@getNumberOfCommentsByPostId');
        Route::post('/submit_comment', 'CommentController@submitComment');
        Route::post('/get_comments_by_chunk_by_post_id', 'CommentController@getCommentsByChunkByPostId');
    });
});
