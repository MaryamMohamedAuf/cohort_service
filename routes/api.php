<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CohortController;

//Route::Resource('cohorts', CohortController::class);


Route::resource('cohorts', \App\Http\Controllers\CohortController::class);