<?php

namespace Sandex\Mensageria\Domain\UseCases;
use \Sandex\Mensageria\Domain\Entities\Mensagem;
use \Illuminate\Http\Client\Request;

interface ListarMensagemUseCase{
    public function listar(Request|null $request):array;
}
