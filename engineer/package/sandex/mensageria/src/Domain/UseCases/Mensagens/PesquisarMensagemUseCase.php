<?php

namespace Sandex\Mensageria\Domain\UseCases;
use \Sandex\Mensageria\Domain\Entities\Mensagem;

interface PesquisarMensagemUseCase{
    public function pesquisar(\Illuminate\Http\Client\Request $request):Mensagem;
}
