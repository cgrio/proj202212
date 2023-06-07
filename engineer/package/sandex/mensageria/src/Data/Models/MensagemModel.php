<?php
namespace Sandex\Mensageria\Data\Models;
 use Illuminate\Database\Eloquent\Model;
 use Sandex\Mensageria\Domain\Entities\Mensagem;

 class MensagemModel extends Model{
    protected $table = 'mensagem';
    protected $guarded = ['id','user_id'];
    protected $fillable = [
           'id',
   'remetente',
     'destinatario',
     'data_envio',
     'assunto',
     'corpo',
    ];

    public function toEntity():Mensagem{
        $entity = new Mensagem();
        $entity->id = $this->id;
        $entity->remetente = $this->remetente;
     $entity->destinatario = $this->destinatario;
     $entity->data_envio = $this->data_envio;
     $entity->assunto = $this->assunto;
     $entity->corpo = $this->corpo;
     return $entity;
    }
}
