<?php

namespace Sandex\Engineer\Presentation\Html\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EngineerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = [];
        $dir = \base_path('/estruturas');
        $results = [];
        $labelsFinais = [];
        $this->processarDiretorio($dir, $results);
        for ($i = 0; $i < count($results); $i++) {
            $texto_das_labels = \str_replace(\base_path(), '', $results[$i]);
            $vetor_de_linha = explode('\\', $texto_das_labels);
            if (count($vetor_de_linha) == 8) {
                $labelsFinais[] = implode('\\', array_slice($vetor_de_linha, 2, 3));
            }
        }
        $data = [
            'arquiteturas' => \array_unique($labelsFinais)
        ];
        return view('sandex.engineer.engineer.index', $data);
    }
    public function editor(Request $request)
    {
        if ($request->get('acao')) {
            return $this->editorRevisao($request);
        }
        $dir = \base_path('/estruturas');
        $results = [];
        $this->processarDiretorio($dir, $results);
        $pastas_de_trabalho = [];
        foreach ($results as $valor) {
            if (\str_contains($valor, $request->get('arquiteturas') . '\\')) {
                $pastas_de_trabalho[] = $valor;
            }
        }
        $pastas_de_trabalho = \array_values($pastas_de_trabalho);
        $lista_strings_templates = $this->obterPadroesBaseadosRegex($results, "/§§([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})§§/");
        $lista_itens_crud = [];
        foreach ($pastas_de_trabalho as $arq) {
            if (!is_dir($arq)) {
                $lista_itens_crud[] = new \Sandex\Engineer\Models\ItensCrud($arq);
            }
        }
        return view('sandex.engineer.engineer.editor', [
            'lista_itens_crud' => $lista_itens_crud,
            'lista_strings_templates' => $lista_strings_templates
        ]);
    }
    public function editorRevisao(Request $request)
    {
        $dir = \base_path('/estruturas');
        $results = [];
        $this->processarDiretorio($dir, $results);
        $pastas_de_trabalho = [];
        foreach ($results as $valor) {
            if (\str_contains($valor, $request->get('arquiteturas') . '\\')) {
                $pastas_de_trabalho[] = $valor;
            }
        }
        $pastas_de_trabalho = \array_values($pastas_de_trabalho);
        $lista_strings_templates = $this->obterPadroesBaseadosRegex($results, "/§§([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})§§/");
        $lista_strings_campos =  $this->obterPadroesBaseadosRegex($results, '#££[A-Za-z]{2,}££#ims');
        $lista_itens_crud = [];
        foreach ($pastas_de_trabalho as $arq) {
            if (!is_dir($arq)) {
                $lista_itens_crud[] = new \Sandex\Engineer\Models\ItensCrud($arq);
            }
        }
        return view('sandex.engineer.engineer.editor', [
            'lista_itens_crud' => $lista_itens_crud,
            'lista_strings_templates' => $lista_strings_templates,
            'lista_strings_campos' => $lista_strings_campos
        ]);
    }

    private function obterPadroesBaseadosRegex($listaArquivos, $pattern = "/££([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})££/")
    {
        $lista_strings_templates = [];
        if (!empty($listaArquivos)) {
            foreach ($listaArquivos as $a) {
                if (!is_dir($a)) {
                    $contents = file_get_contents($a);
                    \preg_match_all($pattern, $contents, $resultadosEncontrados);
                    if (isset($resultadosEncontrados[0])) {
                        \array_push($lista_strings_templates, ...$resultadosEncontrados[0]);
                    }
                }
            }
        }
        return \array_values(\array_unique($lista_strings_templates));
    }
    public function processarDiretorio($dir, &$results = array())
    {
        $files = scandir($dir);
        foreach ($files as $key => $value) {
            $path = realpath($dir . DIRECTORY_SEPARATOR . $value);
            if (!is_dir($path)) {
                $results[] = $path;
            } elseif ($value != "." && $value != "..") {
                $this->processarDiretorio($path, $results);
                //$results[] = $path;
            }
        }
        return $results;
    }
    public function passo1(Request $request)
    {
        $data = [];
        $dir = \base_path('/estruturas');
        $results = [];
        $labelsFinais = [];
        $this->processarDiretorio($dir, $results);
        for ($i = 0; $i < count($results); $i++) {
            $texto_das_labels = \str_replace(\base_path(), '', $results[$i]);
            $vetor_de_linha = explode('\\', $texto_das_labels);
            if (count($vetor_de_linha) == 8) {
                $labelsFinais[] = implode('\\', array_slice($vetor_de_linha, 2, 3));
            }
        }
        $data = [
            'arquiteturas' => \array_unique($labelsFinais)
        ];
        return view('sandex.engineer.engineer.passo1', $data);
    }
    public function passo2(Request $request)
    {
        $dir = $request->get('arquiteturas');
        $results = [];
        $caminho_diretorio = base_path() . DIRECTORY_SEPARATOR . 'estruturas' . DIRECTORY_SEPARATOR . $dir;
        $this->processarDiretorio($caminho_diretorio, $results);
        $lista_strings_templates = $this->obterPadroesBaseadosRegex($results, "/§§([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})§§/");
        $lista_strings_campos =  $this->obterPadroesBaseadosRegex($results, '/££[A-Za-z]{2,}££/is');
      //  $lista_strings_funcoes =  $this->obterPadroesBaseadosRegex($results, '/@@.*@@/');
        return view('sandex.engineer.engineer.passo2', [
            'lista_strings_templates' => $lista_strings_templates,
            'lista_strings_campos' => $lista_strings_campos,
           // 'lista_strings_funcoes' => $lista_strings_funcoes
        ]);
    }
    public function passo3(Request $request)
    {
        return view('sandex.engineer.engineer.passo3', [ 'request' => $request]);
    }
    public function passo4(Request $request)
    {
        return view('sandex.engineer.engineer.passo4', [ 'request' => $request]);
    }

    public function landingPage(){
        return view('sandex.engineer.engineer.landing_page');
    }
}
