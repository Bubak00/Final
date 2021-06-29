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

Route::group(['middleware' => 'api', 'namespace' => 'Auth', 'prefix' => 'auth'], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});

Route::group(['middleware' => 'api', 'namespace' => 'Auth'], function ($router) {

    Route::post('register', 'RegistrationController@register');

});

Route::group(['middleware' => 'api'], function ($router) {

    Route::post('fill-balance', 'UsersController@fillBalance');
    Route::get('balance/history', 'UsersController@showUserBalanceHistory');
    Route::get('my-transactions', 'UsersController@showUserTransfers');
    Route::get('transactions', 'UsersController@showAllTransfers');
    Route::post('transfer', 'UsersController@transfer');

});
