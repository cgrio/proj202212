<?php

use Sandex\Engineer\Presentation\Html\Controllers\EngineerController;


Route::group(['middleware' => 'web'], function () {
    Route::get('/engineer', [EngineerController::class, 'index'])->name('engineer.index');
    Route::post('/engineer/editor', [EngineerController::class, 'editor'])->name('engineer.editor');
    // Route::get('/engineer/create', [ProductHtmlController::class, 'create'])->name('engineer.create');
    // Route::get('/engineer/{product}', [ProductHtmlController::class, 'show'])->name('engineer.show');
    // Route::post('/engineer', [ProductHtmlController::class, 'store'])->name('engineer.store');
});
