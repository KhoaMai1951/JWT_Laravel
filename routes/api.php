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
        //TẠO NHANH USER
        Route::get('/create_user_instant', 'UserController@createUserInstant');
        Route::post('/create_user_instant', 'UserController@createUserInstant');
        //LẤY INFO USER THEO ID
        Route::get('/get_user_info_by_id', 'UserController@getUserInfoById');
        Route::post('/check_follow', 'UserController@checkFollow');
        Route::post('/follow_user', 'UserController@followUser');
        Route::post('/upload_avatar', 'UserController@uploadAvatar');
        Route::post('/update_info', 'UserController@updateInfo');
        Route::post('/change_password', 'UserController@changePassword');
        //TÌM KIẾM USER
        Route::post('/search_user', 'UserController@searchUser');
        Route::get('/search_user', 'UserController@searchUser');
        //LẤY AVATAR
        Route::post('/get_avatar_url', 'UserController@getAvatarUrl');
        Route::get('/get_avatar_url', 'UserController@getAvatarUrl');
        Route::get('/get_user_info_for_comment', 'UserController@getUserInfoForComment');
        // DATA FOR CLIENT TO REQUEST EXPERT ROLE
        Route::get('/data_for_client_to_request_expert_role', 'UserController@dataForClientToRequestExpertRole');
    });
    // POST
    Route::group(['prefix' => '/post'], function () {

        Route::post('/test_dio', 'PostController@testDio');
        // LẤY CHI TIẾT BÀI VIẾT THEO ID
        Route::get('/get_post', 'PostController@getPostById');
        Route::post('/get_post', 'PostController@getPostById');

        Route::group(['middleware' => 'auth:api'], function () {
           // Route::post('/submit_post', 'PostController@submitPost');
        });
        Route::post('/submit_post', 'PostController@submitPost');

        Route::post('/upload_image', 'PostController@uploadImageToStorage');
        // LẤY DS BÀI VIẾT CỦA USER CHO TRANG PROFILE THEO CỤM
        Route::post('/get_all_posts_by_chunk_by_user_id', 'PostController@getAllPostsByChunkByUserId');
        Route::get('/get_all_posts_by_chunk_by_user_id', 'PostController@getAllPostsByChunkByUserId');
        // LẤY DS BÀI VIẾT USER ĐÃ SAVE CHO TRANG PROFILE THEO CỤM
        Route::post('/get_all_saved_posts_by_chunk_by_user_id', 'PostController@getAllSavedPostsByChunkByUserId');
        // LẤY DS BÀI VIẾT THEO CỤM cho trang newsfeed
        Route::post('/get_all_posts_by_chunk', 'PostController@getAllPostsByChunk');
        Route::get('/get_all_posts_by_chunk', 'PostController@getAllPostsByChunk');
        // LẤY DS BÀI VIẾT CHO TRANG HOME NEWSFEED THEO CỤM VÀ THEO TỪ KHÓA TÌM KIẾM
        Route::post('/home_newsfeed', 'PostController@getPostForHomeNewsfeed');
        Route::get('/home_newsfeed', 'PostController@getPostForHomeNewsfeed');
        // LIKE POST
        Route::get('/like_post', 'PostController@likePost');
        // KIỂM TRA LIKE POST
        Route::get('/check_like_post', 'PostController@checkLikePostOrNot');
        // LẤY DS BÀI VIẾT CHO TRANG GLOBAL NEWSFEED THEO CỤM VÀ THEO TỪ KHÓA TÌM KIẾM
        Route::post('/global_newsfeed', 'PostController@getPostForGlobalNewsfeed');
        Route::get('/global_newsfeed', 'PostController@getPostForGlobalNewsfeed');
        // LƯU BÀI VIẾT
        Route::post('/save_post', 'PostController@savePost');
        // BỎ LƯU BÀI VIẾT
        Route::post('/unsave_post', 'PostController@unSavePost');
        // KIỂM TRA ĐÃ LƯU BÀI VIẾT
        Route::post('/check_save_post', 'PostController@checkSavePost');
        // SỬA BÀI VIẾT
        Route::post('/edit_post', 'PostController@editPost');
        // XÓA BÀI VIẾT
        Route::post('/delete_post', 'PostController@deletePost');
        Route::get('/delete_post', 'PostController@deletePost');

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
        // SUBMIT COMMENT
        Route::post('/submit_comment', 'CommentController@submitComment');
        // GET COMMENTS BY CHUNK
        Route::post('/get_comments_by_chunk_by_post_id', 'CommentController@getCommentsByChunkByPostId');
        Route::get('/get_comments_by_chunk_by_post_id', 'CommentController@getCommentsByChunkByPostId');
        // LIKE COMMENT
        Route::get('/like_comment', 'CommentController@likeComment');
        Route::post('/like_comment', 'CommentController@likeComment');
        // DELETE COMMENT
        Route::get('/delete_comment', 'CommentController@deleteComment');
        Route::post('/delete_comment', 'CommentController@deleteComment');
    });
    // SERVER PLANT
    Route::group(['prefix' => '/server_plant'], function () {
        // SEEDER
        Route::get('/seeder', 'ServerPlantController@seeder');
        // LẤY DS THÔNG TIN CÂY CẢNH THEO CỤM
        Route::get('/get_plant_list_by_chunk', 'ServerPlantController@getPlantListByChunk');
        Route::post('/get_plant_list_by_chunk', 'ServerPlantController@getPlantListByChunk');
        // LẤY CHI TIẾT THÔNG TIN CÂY CẢNH THEO ID
        Route::get('/get_plant_detail', 'ServerPlantController@getPlantDetail');
        Route::post('/get_plant_detail', 'ServerPlantController@getPlantDetail');
        // UPLOAD CÂY CẢNH MỚI
        Route::post('/upload_plant', 'ServerPlantController@uploadPlant');
    });
    // SERVER PLANT USER EDIT
    Route::group(['prefix' => '/server_plant_user_edit'], function () {
        // UPLOAD EDIT THÔNG TIN CÂY CẢNH
        Route::post('/upload_plant', 'ServerPlantUserEditController@uploadPlant');
    });
    // EXPERT PENDING
    Route::group(['prefix' => '/expert_pending'], function () {
        // UPLOAD YÊU CẦU LÀM EXPERT
        Route::post('/request_expert', 'PendingExpertController@handleRequestExpert');
        Route::get('/request_expert', 'PendingExpertController@handleRequestExpert');
        // GET DS YÊU CẦU EXPERT
        // GET CHI TIẾT YÊU CẦU EXPERT THEO ID
        Route::get('/get_detail', 'PendingExpertController@getDetail');
        // KIỄM TRA TRẠNG THÁI
        Route::get('/check_status', 'PendingExpertController@checkStatus');
        Route::post('/check_status', 'PendingExpertController@checkStatus');

    });
});
