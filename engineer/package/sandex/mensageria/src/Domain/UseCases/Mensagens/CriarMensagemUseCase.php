<?php 

namespace Sandex\Mensageria\Domain\UseCases;
use Sandex\Mensageria\Domain\Requests\MensagemRequest;

interface CriarMensagemUseCase{
    public function criar(MensagemRequest $request):void;
}