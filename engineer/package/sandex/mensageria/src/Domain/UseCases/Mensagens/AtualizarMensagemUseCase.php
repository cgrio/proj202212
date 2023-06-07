<?php 

namespace Sandex\Mensageria\Domain\UseCases;
use \Sandex\Mensageria\Domain\Entities\Mensagem;

interface AtualizarMensagemUseCase{
    public function atualizar(Mensagem $request):void;
}