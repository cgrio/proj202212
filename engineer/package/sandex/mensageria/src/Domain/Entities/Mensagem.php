<?php

namespace Sandex\Mensageria\Domain\Entities;
use \Datetime;

class Mensagem{
    public int $id;
    public string|null $remetente;
    public string $destinatario;
    public DateTime $data_envio;
    public String $assunto;
    public String $corpo;
    public int $user_id;

}
