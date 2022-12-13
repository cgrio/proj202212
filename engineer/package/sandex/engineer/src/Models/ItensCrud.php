<?php

namespace Sandex\Engineer\Models;

class ItensCrud
{
    public string $caminho = "";
    public string $conteudo = "";
    public string $extensao = "";
    public string $nome_arquivo = "";

    public function __construct(
        string $caminho = ""
    ) {
        $this->caminho = $caminho;
        $this->conteudo = \file_get_contents($caminho);
        $temp = explode("\\", $caminho);
        $nome_arquivo = end($temp);
        unset($temp);
        $nome_arquivo = str_replace('.estrutura', '', $nome_arquivo);
        $temp = explode(".", $nome_arquivo);
        $this->extensao = end($temp);
        unset($temp);
        $this->nome_arquivo = $nome_arquivo;
    }
}
