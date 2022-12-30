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
                        <div class="p-5">
                        @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
           'campo1',
            'placeholder'=>
            'campo1',
            'campo_label'=>  'Campo 1',
            'required'=>'required',
            'autofocus'=>'',
            'value'=> ''
            ])
@include('sandex.engineer.engineer.partes.formulario.submit', [
    'label'=>'Continuar'
    ])
</div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')

@endsection
