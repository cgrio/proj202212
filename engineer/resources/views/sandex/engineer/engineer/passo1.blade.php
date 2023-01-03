@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="engineer-content">
                <div class="div-head">
                    <p class="title">Passo 1</p>
                </div>
                <div class="div-body">
                    <p class="text">Por onde vamos começar a gerar códigos automatizados? Preencha as informações:
                        abaixo:</p>
                        <form method="POST" action="/engineer/passo2">
                        @csrf

                        @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'arquiteturas',
                        'campo_label'=>'Arquiteturas Disponíveis',
                        'required'=>'required',
                        'autofocus'=>'autofocus',
                        'valores'=> \array_values($arquiteturas),
                        'value'=> ''
                        ])

                        @include('sandex.engineer.engineer.partes.formulario.submit', [
                        'label'=>'Continuar'
                        ])
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')

@endsection
