@extends('layouts.app')
@section('content')
<div class="container">

<h1 class="h1">Construção de templates</h1>
<p>Preencha as informações para ver os resultados</p>

<form method="POST" action="{{ route('login') }}">
                        @csrf
	<div class="row justify-content-center p-5">
		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.container',[
		'label'=> 'label',
		'id'=> 'id',
		'active'=> 'active',
		'selected_boolean'=> false,
		])
	</div>
    @include('sandex.engineer.engineer.partes.formulario.submit', [
                        'label'=>'Continuar'
                        ])
        </form>
</div>
@endsection

@section('scripts')
<script type="text/javascript">

    function saidaDeCampo(){
    }
//inputs as NodeList
var inputs = document.querySelectorAll("input");

// Loop to asign event
inputs.forEach(function(item){
    item.addEventListener("blur", function(gatilho){

       // console.log(gatilho.getAttribute('name'));
        console.log(gatilho);
       let campo = gatilho.target;
       console.log(campo.getAttribute('name'));
       let listaInputs = document.querySelectorAll("input");
       listaInputs.forEach(function(itemLista){
        let regex = /[^a-z]/gi;
            if(itemLista.getAttribute('name') == campo.getAttribute('name')){
                console.log('sim');
            }else{
                if(itemLista.getAttribute('name').replace(regex, "").toLowerCase() == campo.getAttribute('name').replace(regex, "").toLowerCase()){
                console.log('encontrei o igual');
                console.log(/[A-Z]/.test(itemLista.getAttribute('name').replace(regex, "")));
            }

        console.log('nao');
}
       });

    });
   });

    </script>
@endsection
