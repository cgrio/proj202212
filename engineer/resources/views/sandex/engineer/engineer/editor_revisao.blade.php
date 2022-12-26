@extends('layouts.app')
@section('content')
<div class="container">

<h1 class="h1">Revisão</h1>
<p>Preencha as informações para ver os resultados</p>

<form method="POST" action="{{ route('login') }}">
                        @csrf
	<div class="row justify-content-center p-5">
		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.container',[
		'id'=> 'id'
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
    item.addEventListener("blur", function(campo){
        console.log(campo['name']);
        console.log("dd");
    });
   });

    </script>
@endsection
