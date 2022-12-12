<?php

namespace §§Fornecedor§§\§§Pacote§§\Data\Services;

use §§Fornecedor§§\§§Pacote§§\Domain\Entities\§§ModeloSingular§§;
use §§Fornecedor§§\§§Pacote§§\Domain\UseCases\I§§ModeloSingular§§UseCase;
use §§Fornecedor§§\§§Pacote§§\Domain\Repositories\I§§ModeloSingular§§Repository;

class §§ModeloSingular§§Service implements I§§ModeloSingular§§UseCase
{
    public function __construct(I§§ModeloSingular§§Repository $repository)
    {
        $this->repository = $repository;
    }

    public function index($request): array
    {
        return $this->repository->index($request);
    }

    public function show(int $id): §§ModeloSingular§§
    {
        return $this->repository->show($id);
    }

    public function delete(int $id): bool
    {
        return $this->repository->delete($id);
    }

    public function store(§§ModeloSingular§§ $§§modelosingular§§): §§ModeloSingular§§
    {
        return $this->repository->store($§§modelosingular§§);
    }

    public function user§§ModeloPlural§§($request): array
    {
        return $this->repository->user§§ModeloPlural§§($request);
    }
}
