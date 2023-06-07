<?php
namespace Sandex\Mensageria\Data\UseCases;

use Sandex\Mensageria\Data\Models\MensagemModel;
use Sandex\Mensageria\Domain\UseCases\ApagarMensagemUseCase;

class PostgreSQLDatabaseApagarMensagem implements ApagarMensagemUseCase{
    public function apagar(int $id): bool
    {
        $model = MensagemModel::findOrFail($id);
        if($model != null){
            return $model->destroy();
        }
        return false;
    }
}
