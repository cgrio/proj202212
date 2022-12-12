<?php

namespace Sandex\Engineer\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Hamcrest\Type\IsArray;

class CrudCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'engineer:crud';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Sandex Engineer Crud operações crud baseados em template';


    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
    }

    private function listarDiretoriosTemplates()
    {
    }

    private function listarTabelasBD()
    {
    }

    private function obterCamposTabelaBD($tabelaNome)
    {
        $campos = [];

        if (Schema::hasTable($tabelaNome)) {
            $esquema = DB::select("describe $tabelaNome");
            dump($esquema);
            foreach ($esquema as $e) {
                $campos[] = [
                    "nome" => $e->Field,
                    "tipo" => strpos($e->Type, "(") > 0 ? substr($e->Type, 0, strpos($e->Type, "(")) : $e->Type,
                    "tamanho" => strpos($e->Type, "(") > 0 ? substr($e->Type, strpos($e->Type, "(") + 1, strpos($e->Type, ")") - strpos($e->Type, "(") - 1) : 0,
                    "obrigatorio" => $e->Null == "NO" ? true : false,
                    "default" => $e->Default,
                    'chave' => $e->Key,
                    'extra' => $e->Extra
                ];
            }
            return $campos;
        }
    }
}
