<?php

namespace Sandex\Mensageria\Domain\UseCases;
use \Sandex\Mensageria\Domain\Entities\Mensagem;

interface EnviarMensagemUseCase{
    public function enviar():bool;
}
