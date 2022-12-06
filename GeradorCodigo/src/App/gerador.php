<?php

namespace Cgrio\GeradorCodigo\App;

/*
CDU01 - Substituir String
1 - Lista o primeiro nível da pasta estruturas pra perguntar a linguagem
2 - Lista o framework ou operação desejada
3 - Lista a operação ou crud desejado
4 - Para cada Arquivo encontrado em pastas e subpastas
    4.1 - Obtém os nomes com o padrão §§[A-Za-z0-9\(\)]§§
    4.1.1 - Pergunta a String correspondente do nome

SF01 - Substituir String

1 - Se nome tiver o caracter "("
    1.1 - Executa SF01 passando
*/

class Gerador
{
    private string $linguagem = '';
    private string $framework = '';
    private string $modelos = '';
    public function __construct()
    {
        $caminho = __DIR__ . "\\..\\estruturas";
        echo $caminho;
        $this->linguagem = self::listarESelecionarPasta($caminho, "Linguagem");
        $this->framework = self::listarESelecionarPasta($this->linguagem, "Framework");
        $this->modelos = self::listarESelecionarPasta($this->framework, "Modelos de Arquitetura");
        $lista = self::processarDiretorio($this->modelos);
        $this->obterStringsTemplateDeDiretorio($lista);
    }

    public function listarESelecionarPasta(string $caminho, string $label)
    {
        $this->printar($caminho, 'VERDE');
        $diretorio = dir($caminho);
        $listaLinguagem = [];
        while ($arquivo = $diretorio->read()) {
            if ($arquivo !== "." &&  $arquivo !== "..") {
                $listaLinguagem[] = $arquivo;
            }
        }
        $respostaLinguagem = -1;
        while ($respostaLinguagem == -1 || $respostaLinguagem > count($listaLinguagem) || empty($respostaLinguagem)) {
            print("(Digite 0 caso queira para sair)\n");
            print("Linguagens disponíveis:\n");
            foreach ($listaLinguagem as $itemLista) {
                echo ((array_search($itemLista, $listaLinguagem) + 1) . " - " . $itemLista . "\n");
            }
            $line = readline("Selecione $label:");
            if ($line == 0) {
                exit();
            }
            if ($line > 0 and $line <= count($listaLinguagem)) {
                $respostaLinguagem = $line;
            }
            readline_add_history($line);
        }
        return $caminho . '\\' . $listaLinguagem[$respostaLinguagem - 1];
        //dump history
        //print_r(readline_list_history());
        //dump variables
        //print_r(readline_info());
        $diretorio->close();
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

    public function obterStringsTemplateDeDiretorio($listaArquivos)
    {
        $listaStringsTemplate = [];
        if (!empty($listaArquivos)) {
            foreach ($listaArquivos as $a) {
                if (!is_dir($a)) {
                    $contents = file_get_contents($a);
                    // \Cgrio\GeradorCodigo\Helpers::dd($contents);
                    $pattern = "/§§(.*)§§/";
                    $pattern = "/§§([A-Za-z0-9\(\);\.\[\]\'\"]){2,}§§/";
                    $pattern = "/§§([A-Za-z0-9\(\)\$\"\'£\=\-\>\ ;]{2,})§§/";

                    $flags = 0;
                    $offset = 0;
                    \preg_match_all($pattern, $contents, $resultadosEncontrados, $flags, $offset);
                    // \Cgrio\GeradorCodigo\Helpers::dd($contents);
                    \array_push($listaStringsTemplate, ...$resultadosEncontrados[0]);
                }
            }
        }
        \Cgrio\GeradorCodigo\Helpers::dd(\array_values(\array_unique($listaStringsTemplate)));

        return \array_unique($listaStringsTemplate);
    }

    public function printar($mensagem, $cor)
    {
        switch (strtoupper($cor)) {
            case 'PRETO':
                echo "\033[30m" . $mensagem;
                break;
            case 'VERMELHO':
                echo "\033[31m" . $mensagem;
                break;
            case 'VERDE':
                echo "\033[32m" . $mensagem;
                break;
            case 'AMARELO':
                echo "\033[33m" . $mensagem;
                break;
            case 'AZUL':
                echo "\033[34m" . $mensagem;
                break;
            case 'MAGENTA':
                echo "\033[35m" . $mensagem;
                break;
            case 'AZULCLARO':
                echo "\033[96m" . $mensagem;
                break;
            default:
                echo "\033[30m" . $mensagem;
                break;
        }
        echo "\033[39m" . " ";
        echo PHP_EOL;
    }
}
