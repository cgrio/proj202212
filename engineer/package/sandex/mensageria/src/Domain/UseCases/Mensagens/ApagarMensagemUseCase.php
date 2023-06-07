<?php 

namespace Sandex\Mensageria\Domain\UseCases;

interface ApagarMensagemUseCase{
    public function apagar(int $id):bool;
}