@extends('layouts.app')
@section('content')
<div class="container">

<h1 class="h1">Construção de templates</h1>
<p>Preencha as informações para ver os resultados</p>

	<div class="row justify-content-center">

    <form method="POST" action="/engineer/editor">
        @csrf
        <div class="p-5">

            <input id="acao" placeholder="acao" type="text"
			class="form-control" name="acao" value="revisar">
        </div>

		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.container')

        <div class="p-5">

            @include('sandex.engineer.engineer.partes.formulario.submit', [
                'label'=>'Continuar'
                ])
            </div>
    </form>
    </div>
</div>
<div id="app" class="app"></div>
<div id="main" class="main"></div>
@endsection

@section('scripts')
<script type="text/javascript">
    const camelCase = str => {
    let string = str.toLowerCase().replace(/[^A-Za-z0-9]/g, ' ').split(' ')
                    .reduce((result, word) => result + capitalize(word.toLowerCase()))
    return string.charAt(0).toLowerCase() + string.slice(1)
    }
    const capitalize = str => str.charAt(0).toUpperCase() + str.toLowerCase().slice(1)
    const firstUpper = str => str.charAt(0).toUpperCase() + str.slice(1)
    const toSnakeCase = str => str && str.match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g).map(x => x.toLowerCase()).join('_');
    const snakeToCamel = str =>  str.toLowerCase().replace(/([-_][a-z])/g, group => group.toUpperCase().replace('-', '').replace('_', ''));
    const camposDuplos = [
        'fornecedor',
        'pacote',
        'modelosingular',
        'modeloplural'
    ];
    //inputs as NodeList
    let inputs = document.querySelectorAll("input");
    // Loop to asign event
    inputs.forEach(function(item){
        item.addEventListener('blur', function(e){
            regrasFormulario(e.target);
        });
                    });
    function regrasFormulario(campo){
            inputs.forEach(function(itemLista){
                let regex = /[^campo]/gi;
                regex = /[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g;
                regex = /[^a-zA-Z]/gi;
                //if(itemLista.getAttribute('name').replace(regex, "").toLowerCase() == campo){
                    if(itemLista.getAttribute('name').replace(regex, "").toLowerCase() === campo.getAttribute('name').replace(regex, "").toLowerCase()){
                    console.log('encontrei com mesmo nome lower');
                    if(itemLista.getAttribute('name').replace(regex, "") !== campo.getAttribute('name').replace(regex, "")){
                        console.log("Mesmo campo mas com case diferente");
                        console.log(itemLista.getAttribute('name'));
                        if((/[A-Z]/).test(itemLista.getAttribute('name'))){
                            itemLista.value = firstUpper(snakeToCamel(campo.value));
                        }else{
                            itemLista.value = toSnakeCase(campo.value);
                        }
                    }
                }
        });
    }
    function salvarArrayLS(chave, array_para_salvar){
        localStorage.setItem(chave, JSON.stringify(array_para_salvar));
    }
    function recuperarArrayLS(chave){
        return JSON.parse(localStorage.getItem(chave));
    }
    function limparLS(){
        localStorage.clear();
    }


</script>
@endsection
