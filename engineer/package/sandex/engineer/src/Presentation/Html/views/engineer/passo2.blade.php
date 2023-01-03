@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="engineer-content">
                <div class="div-head">
                    <p class="h2">Passo 2</p>
                </div>
                <div class="div-body">
                    <p class="text">Por onde vamos começar a gerar códigos automatizados? Preencha as informações:
                        abaixo:</p>
                    <form method="POST" action="/engineer/passo3">
                        @csrf

@if ($lista_strings_templates)
    @for ($i = 1; $i < count($lista_strings_templates);$i++)
    @php if(!(str_contains($lista_strings_templates[$i], '(') OR str_contains(strtolower($lista_strings_templates[$i]), 'modelo'))): @endphp
            @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
            str_replace("§","",$lista_strings_templates[$i])."-{$i}",
            'placeholder'=>
            str_replace("§","",$lista_strings_templates[$i]),
            'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
            'required'=>'required',
            'autofocus'=>'',
            'value'=> ''
            ])
            @php endif; @endphp
    @endfor
@endif



@include('sandex.engineer.engineer.partes.accordion.accordion_abertura', ['titulo'=> 'Modelo', 'id'=>'a1'] )
@include('sandex.engineer.engineer.partes.accordion.item_abertura',['titulo'=> 'Modelo', 'id'=>'a1'] )


@if ($lista_strings_templates)
    @for ($i = 1; $i < count($lista_strings_templates);$i++)
    @php if((!str_contains($lista_strings_templates[$i], '(') AND str_contains(strtolower($lista_strings_templates[$i]), 'modelo'))): @endphp

            @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
            str_replace("§","",$lista_strings_templates[$i])."-{$i}",
            'placeholder'=>
            str_replace("§","",$lista_strings_templates[$i]),
            'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
            'required'=>'required',
            'autofocus'=>'',
            'value'=> ''
            ])
            @php endif; @endphp
    @endfor
@endif

    @include('sandex.engineer.engineer.partes.accordion.item_fechamento' )
@include('sandex.engineer.engineer.partes.accordion.accordion_fechamento' )


@include('sandex.engineer.engineer.partes.accordion.accordion_abertura', ['titulo'=> 'Campos', 'id'=>'a2'] )
@include('sandex.engineer.engineer.partes.accordion.item_abertura' ,['titulo'=> 'Campos', 'id'=>'a2'] )

@if ($lista_strings_campos)
        @for ($i = 0; $i < count($lista_strings_campos);$i++)
                @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
                str_replace("£","",$lista_strings_campos[$i])."-{$i}",
                'placeholder'=>
                str_replace("£","",$lista_strings_campos[$i]),
                'campo_label'=> str_replace("£","",$lista_strings_campos[$i]),
                'required'=>'required',
                'autofocus'=>'',
                'value'=> ''
                ])
        @endfor
    @endif
    @include('sandex.engineer.engineer.partes.accordion.item_fechamento' )
@include('sandex.engineer.engineer.partes.accordion.accordion_fechamento' )


</div>



<div class="p-5">

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
