<?php 

namespace Sandex\Mensageria\Domain\Requests;


class MensagemRequest{
    public int|null $id;
    public string|null $remetente;
    public string $destinario;
    public string $data_envio;
    public string $assunto;
    public string $corpo;
    public int $user_id;
}