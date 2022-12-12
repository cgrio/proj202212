<?php

namespace Sandex\Engineer;

use Illuminate\Support\ServiceProvider;

class SandexEngineerServiceProvider extends ServiceProvider
{
    /*
     * @return void
     */
    public function boot()
    {
        //
        $this->loadRoutesFrom(__DIR__ . '/routes.php');
        //  $this->loadMigrationsFrom(__DIR__ . '/Data/Migrations');
        //  $this->loadViewsFrom(__DIR__.'/views', 'cgrio');

        $this->publishes([
            __DIR__ . '/Presentation/Html/views' => base_path('resources/views/sandex/engineer'),
        ]);

        // $this->publishes([
        //     __DIR__.'/views/assets' => base_path('resources'),
        // ]);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function register()
    {
        $commands = [
            'Sandex\Engineer\Commands\CrudCommand',
        ];
        $this->commands($commands);
        //$this->app->make('Cgrio\Comm\Controllers\CrudController');
    }
}
