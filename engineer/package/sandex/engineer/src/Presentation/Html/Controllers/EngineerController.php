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



    public function indexOld(Request $request)
    {
        $data = [];
        // $data = Response(
        //     (new ProductIndexHandler(
        //         new ProductService(new ProductRemoteMysqlDataSourceRepository())
        //     )
        //     )->handle($request)
        // );
        $dir = \base_path('/estruturas');
        $results = [];
        $this->processarDiretorio($dir, $results);
        for ($i = 0; $i < count($results); $i++) {
            $results[$i] = \str_replace(\base_path(), '', $results[$i]);
            $vetor_de_linha = explode('\\', $results[$i]);
            $results[$i] = implode('\\', array_slice($vetor_de_linha, 2, 3));
        }

        $results = array_values(array_unique($results));
        $linguagens = [];
        $frameworks = [];
        $arquiteturas = [];

        for ($i = 0; $i < count($results); $i++) {
            $vetor_de_linha = explode('\\', $results[$i]);
            if (isset($vetor_de_linha[0])) {
                $linguagens[$vetor_de_linha[0]] =   $vetor_de_linha[0];
            }
            if (isset($vetor_de_linha[1])) {
                $frameworks[$vetor_de_linha[0]][$vetor_de_linha[1]][] =  $vetor_de_linha[1];
            }
            if (isset($vetor_de_linha[2])) {
                $arquiteturas[$vetor_de_linha[0]][$vetor_de_linha[1]][$vetor_de_linha[2]][] =  $vetor_de_linha[2];
            }
        }
        $data = [
            'linguagens' => $linguagens,
            'frameworks' => $frameworks,
            'arquiteturas' => $arquiteturas
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
        $lista_strings_templates = $this->obterStringsTemplateDeDiretorio($pastas_de_trabalho);

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
        $lista_strings_templates = $this->obterStringsTemplateDeDiretorio($pastas_de_trabalho);

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

    private function obterStringsTemplateDeDiretorio($listaArquivos)
    {
        $lista_strings_templates = [];
        if (!empty($listaArquivos)) {
            foreach ($listaArquivos as $a) {
                if (!is_dir($a)) {
                    $contents = file_get_contents($a);
                    $pattern = "/§§(.*)§§/";
                    $pattern = "/§§([A-Za-z0-9\(\);\.\[\]\'\"]){2,}§§/";
                    $pattern = "/§§([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})§§/";

                    $flags = 0;
                    $offset = 0;
                    \preg_match_all($pattern, $contents, $resultadosEncontrados, $flags, $offset);
                    \array_push($lista_strings_templates, ...$resultadosEncontrados[0]);
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
                $results[] = $path;
            }
        }
        return $results;
    }

}


