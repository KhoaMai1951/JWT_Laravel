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
