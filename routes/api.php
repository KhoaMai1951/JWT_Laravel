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
    // USER
    // USER AUTHENTICATE SYSTEM
    Route::post('/login', 'UserController@login');
    Route::post('/register', 'UserController@register');
    Route::post('/activate_account', 'UserController@activateAccount');
    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('/logout', 'UserController@logout');
        Route::get('/get_data_with_token', 'UserController@getData');
    });
    Route::get('/get_data', 'UserController@getData');

    // POST
    Route::group(['prefix' => '/post'], function () {
        Route::post('/submit_post', 'PostController@submitPost');
        Route::post('/test_dio', 'PostController@testDio');
        Route::get('/get_post', 'PostController@getPostById');
    });

    // TAG
    Route::group(['prefix' => '/tag'], function () {
        Route::get('/get_all_tags', 'TagController@getAllTags');
        Route::get('/get_all_tags_by_type_id', 'TagController@getAllTagsByTypeId');
    });
});
