<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/test', 'ImageController@test')->name('test');
Route::get('/show_token', 'ImageController@showToken')->name('show token');
Route::post('/test', 'ImageController@upload')->name('upload');
Route::get('/test2', 'ImageController@uploadPage')->name('upload page');
Route::post('/app_login', 'UserController@appLogin')->name('upload page');
Route::get('/app_login', 'UserController@appLogin')->name('upload page');
Route::get('/send-mail', function () {

    $details = [
        'title' => 'Mail from Don\'t leaf me.com',
        'body' => 'This is for testing email using smtp'
    ];

    \Mail::to('chronicle1951@gmail.com')->send(new \App\Mail\MailNotify($details));

    dd("Email is Sent.");
});

Route::group(['prefix' => '/admin', 'middleware' => ['auth', 'role']], function () {
    //SERVER PLANT
    Route::group(['prefix' => '/server_plant'], function () {
        //DS PLANT
        Route::get('/list_plant', 'ServerPlantController@listPlant')->name('server_plant.list_plant');
        //DS PLANT ĐÓNG GÓP
        Route::get('/list_plant_contribute', 'ServerPlantController@listPlantContributePage')->name('server_plant.list_plant_contribute');
        //DS PLANT CHỈNH SỬA
        Route::get('/list_plant_edit', 'ServerPlantController@listPlantEditPage')->name('server_plant.list_plant_edit');
        //CHI TIẾT PLANT
        Route::get('/detail/{id}', 'ServerPlantController@detailPage')->name('server_plant.detail');
        //CHI TIẾT PLANT CONTRIBUTE
        Route::get('/detail_contribute/{id}', 'ServerPlantController@detailContributePage')->name('server_plant.detail');
        //CHI TIẾT PLANT EDIT
        Route::get('/detail_edit', 'ServerPlantController@detailEditPage')->name('server_plant.edit');
        //ADD PLANT PAGE
        Route::get('/add_plant', 'ServerPlantController@addPlantPage')->name('server_plant.add_plant');
        //ADD PLANT ADMIN
        Route::post('/add_plant', 'ServerPlantController@addPlant')->name('server_plant.add_plant');
        //ADMIN UPDATE CHI TIẾT PLANT
        Route::post('/admin_update', 'ServerPlantController@adminUpdate')->name('server_plant.update');
        //ADMIN CHẤP NHẬN PLANT VÀO DB CHÍNH THỨC
        Route::get('/accept_contribute/{id}', 'ServerPlantController@acceptContribute')->name('server_plant.update');
    });
    //PENDING EXPERT
    Route::group(['prefix' => '/expert_pending'], function () {
        //DS PENDING EXPERT
        Route::get('/list_pending', 'PendingExpertController@pendingExpertPage')->name('expert_pending.list_pending');
        //CHI TIẾT PENDING EXPERT
        Route::get('/pending_detail/{id}', 'PendingExpertController@pendingExpertDetailPage');
        //DUYỆT EXPERT
        Route::post('/grant_expert', 'PendingExpertController@grantExpert');
        //DS EXPERT
        Route::get('/list_expert', 'PendingExpertController@listExpertPage');
    });
});
