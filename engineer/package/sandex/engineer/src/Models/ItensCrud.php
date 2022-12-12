<?php

namespace Sandex\Engineer\Models;

class ItensCrud
{
    public string $caminho = "";
    public string $conteudo = "";
    public string $extensao = "";
    public string $nome = "";

    public function __construct(
        string $caminho = ""
    ) {
        $this->caminho = $caminho;
        $this->conteudo = \file_get_contents($caminho);
        $temp = explode("\\", $caminho);
        $nome = end($temp);
        unset($temp);
        $nome = str_replace('.estrutura', '', $nome);
        @dump($nome);
        $temp = explode(".", $nome);
        $this->extensao = end($temp);
        unset($temp);
        $this->nome = $nome;
    }
}
