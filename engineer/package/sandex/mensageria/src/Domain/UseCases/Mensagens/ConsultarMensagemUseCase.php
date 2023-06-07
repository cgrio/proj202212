<?php

namespace Sandex\Mensageria\Domain\UseCases;

interface ConsultarMensagemUseCase{
    public function consultar(int $id):Mensagem;
}
