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
    Route::post('/login', 'UserController@login');
    Route::post('/register', 'UserController@register');
    Route::get('/logout', 'UserController@logout')->middleware('auth:api');
    Route::get('/get_data_with_token', 'UserController@getData')->middleware('auth:api');
    Route::get('/get_data', 'UserController@getData');

    Route::group(['prefix' => '/user'], function (){
        Route::post('/upload_image', 'UserController@uploadImage');
        Route::post('/upload_image_s3', 'UserController@uploadS3');

    });

    Route::get('/test_tag', 'TagController@test');
    Route::get('/test_tag_type', 'TagTypeController@test');

    // POST
    Route::group(['prefix' => '/post'], function (){
        Route::get('/test_attach_tag', 'PostController@testAttachTag');
        Route::get('/test_image_upload', 'PostController@testImageUploadPage');
        Route::post('/submit_post', 'PostController@submitPost');
        Route::get('/get_post', 'PostController@getPostById');

    });
});
