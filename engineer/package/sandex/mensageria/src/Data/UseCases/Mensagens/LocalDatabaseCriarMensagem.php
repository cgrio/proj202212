<?php
namespace Sandex\Mensageria\Data\UseCases;

use Illuminate\Validation\Validator;
use Sandex\Mensageria\Data\Models\MensagemModel;
use Sandex\Mensageria\Domain\Entities\Mensagem;
use Sandex\Mensageria\Domain\UseCases\ApagarMensagemUseCase;
use Sandex\Mensageria\Domain\UseCases\CriarMensagemUseCase;

class PostgreSQLDatabaseCriarMensagem implements CriarMensagemUseCase{
    public function criar(\Sandex\Mensageria\Domain\Requests\MensagemRequest $request): void
    {
        $validator = Validator::make($request->all(), [
            'remetente' => 'max:255',
            'destinatario' => 'required',
            'data_envio' => 'after_or_equal:'. date('Y-m-d'),
            'assunto' => 'required',
            'corpo' => 'required',
        ]);

    }
}
