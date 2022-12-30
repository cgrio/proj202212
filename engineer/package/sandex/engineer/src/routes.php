<?php

use Sandex\Engineer\Presentation\Html\Controllers\EngineerController;


Route::group(['middleware' => 'web'], function () {
    Route::get('/engineer', [EngineerController::class, 'index'])->name('engineer.index');
    Route::post('/engineer/editor', [EngineerController::class, 'editor'])->name('engineer.editor');
    Route::get('/engineer/passo1', [EngineerController::class, 'passo1'])->name('engineer.passo1');
    Route::post('/engineer/passo2', [EngineerController::class, 'passo2'])->name('engineer.passo2');
    Route::post('/engineer/passo3', [EngineerController::class, 'passo3'])->name('engineer.passo3');
    Route::post('/engineer/passo4', [EngineerController::class, 'passo4'])->name('engineer.passo4');
    // Route::get('/engineer/create', [ProductHtmlController::class, 'create'])->name('engineer.create');
    // Route::get('/engineer/{product}', [ProductHtmlController::class, 'show'])->name('engineer.show');
    // Route::post('/engineer', [ProductHtmlController::class, 'store'])->name('engineer.store');
});
