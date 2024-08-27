<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CohortController;

Route::get('/', function () {
    return view('welcome');
});
Route::resource('cohorts', CohortController::class);
Route::get('/csrf-token', function () {
    return response()->json(['csrf_token' => csrf_token()]);
});
