@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
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
                        @for ($i = 1; $i < count($lista_strings_templates);$i++) @php if(!(str_contains($lista_strings_templates[$i], '(' ) OR str_contains(strtolower($lista_strings_templates[$i]), 'modelo' ))): @endphp @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
                            str_replace("§","",$lista_strings_templates[$i])."-{$i}",
                            'placeholder'=>
                            str_replace("§","",$lista_strings_templates[$i]),
                            'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
                            'requerido'=>'required',
                            'autofocus'=>'',
                            'value'=> ''
                            ])
                            @php endif; @endphp
                            @endfor
                            @endif
                    </form>
                    <hr />
                    <div class="row">
                        <div class="col">
                            <div id='form-modelo'>
                                <form action="">

                                    @include('sandex.engineer.engineer.partes.accordion.accordion_abertura', ['titulo'=> 'Modelo', 'id'=>'a1'] )
                                    @include('sandex.engineer.engineer.partes.accordion.item_abertura',['titulo'=> 'Modelo', 'id'=>'a1'] )
                                    @if ($lista_strings_templates)
                                    @for ($i = 1; $i < count($lista_strings_templates);$i++) @php if( (!str_contains($lista_strings_templates[$i], '(' ) AND str_contains(strtolower($lista_strings_templates[$i]), 'modelo' )) AND !str_contains($lista_strings_templates[$i], 'ModeloPlural' ) AND !str_contains($lista_strings_templates[$i], 'ModeloSingular' )): @endphp @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
                                        str_replace("§","",$lista_strings_templates[$i])."-{$i}",
                                        'placeholder'=>
                                        str_replace("§","",$lista_strings_templates[$i]),
                                        'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
                                        'requerido'=>'required',
                                        'autofocus'=>'',
                                        'value'=> ''
                                        ])
                                        @php endif; @endphp
                                        @endfor
                                        @endif
                                        <div class="col-md-8 offset-md-4">
                                            <button type="button" id="btn-modelo" onclick="addModelo()" class="btn btn-primary btn-sm">
                                                Adicionar
                                            </button>
                                            <button type="reset" id="btn-campos" class="btn btn-light btn-sm">
                                                Apagar
                                            </button>
                                        </div>
                                        @include('sandex.engineer.engineer.partes.accordion.item_fechamento' )
                                        @include('sandex.engineer.engineer.partes.accordion.accordion_fechamento' )
                                </form>
                            </div>
                            <br />
                            <div id='form-campos' class="invisible">
                                <form action="">

                                    @include('sandex.engineer.engineer.partes.accordion.accordion_abertura', ['titulo'=> 'Campos', 'id'=>'a2'] )
                                    @include('sandex.engineer.engineer.partes.accordion.item_abertura' ,['titulo'=> 'Campos', 'id'=>'a2'] )
                                    <!-- @if ($lista_strings_campos)
                                    @for ($i = 0; $i < count($lista_strings_campos);$i++) @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
                                        str_replace("£","",$lista_strings_campos[$i])."-{$i}",
                                        'placeholder'=>
                                        str_replace("£","",$lista_strings_campos[$i]),
                                        'campo_label'=> str_replace("£","",$lista_strings_campos[$i]),
                                        'requerido'=>'required',
                                        'autofocus'=>'',
                                        'value'=> ''
                                        ])
                                        @endfor
                                        @endif -->
                                        @include('sandex.engineer.engineer.partes.componentes.campo_modelo' )
                                        <div class="col-md-8 offset-md-4">
                                            <button type="button" onclick="addCampo()" class="btn btn-primary btn-sm">
                                                Adicionar
                                            </button>
                                            <button type="reset" class="btn btn-light btn-sm">
                                                Apagar
                                            </button>
                                        </div>
                                        @include('sandex.engineer.engineer.partes.accordion.item_fechamento' )
                                        @include('sandex.engineer.engineer.partes.accordion.accordion_fechamento' )
                                </form>
                            </div>
                        </div>
                        <div class="col">
                        <div id="modelo_display">

                        </div>
                        <div id="campos_display">

                        </div>
                        </div>
                    </div>
                </div>

                <div class="p-5">
                    @include('sandex.engineer.engineer.partes.formulario.submit', [
                    'label'=>'Continuar'
                    ])
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection

@section('scripts')
<script type="text/javascript">
    let modelo_definido = false;
    var lista_modelos = [];
    let modeloAtual = null;

    const camelCase = str => {
        let string = str.toLowerCase().replace(/[^A-Za-z0-9]/g, ' ').split(' ')
            .reduce((result, word) => result + capitalize(word.toLowerCase()))
        return string.charAt(0).toLowerCase() + string.slice(1)
    }
    const capitalize = str => str.charAt(0).toUpperCase() + str.toLowerCase().slice(1)
    const firstUpper = str => str.charAt(0).toUpperCase() + str.slice(1)
    const toSnakeCase = str => str && str.match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g).map(x => x.toLowerCase()).join('_');
    const snakeToCamel = str => str.toLowerCase().replace(/([-_][a-z])/g, group => group.toUpperCase().replace('-', '').replace('_', ''));
    const camposDuplos = [
        'fornecedor',
        'pacote',
        'modelosingular',
        'modeloplural'
    ];
    //inputs as NodeList
    let inputs = document.querySelectorAll("input");
    // Loop to asign event
    inputs.forEach(function(item) {
        item.addEventListener('blur', function(e) {
            regrasFormulario(e.target);
        });
    });

    function regrasFormulario(campo) {
        inputs.forEach(function(itemLista) {
            let regex = /[^campo]/gi;
            regex = /[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g;
            regex = /[^a-zA-Z]/gi;
            //if(itemLista.getAttribute('name').replace(regex, "").toLowerCase() == campo){
            if (itemLista.getAttribute('name').replace(regex, "").toLowerCase() === campo.getAttribute('name').replace(regex, "").toLowerCase()) {
                if (itemLista.getAttribute('name').replace(regex, "") !== campo.getAttribute('name').replace(regex, "")) {
                    if ((/[A-Z]/).test(itemLista.getAttribute('name'))) {
                        itemLista.value = firstUpper(snakeToCamel(campo.value));
                    } else {
                        itemLista.value = toSnakeCase(campo.value);
                    }
                }
            }
        });
    }

    function salvarArrayLS(chave, array_para_salvar) {
        localStorage.setItem(chave, JSON.stringify(array_para_salvar));
    }

    function recuperarArrayLS(chave) {
        return JSON.parse(localStorage.getItem(chave));
    }

    function limparLS() {
        localStorage.clear();
    }

    class Modelo {
        modeloCaixaBaixaSingular = '';
        modeloCaixaBaixaPlural = '';
        modeloCaixaAltaSingular = '';
        modeloCaixaAltaPlural = '';
        campos = [];
        constructor(modeloCaixaBaixaSingular, modeloCaixaBaixaPlural) {

            this.modeloCaixaBaixaSingular = modeloCaixaBaixaSingular;
            this.modeloCaixaBaixaPlural = modeloCaixaBaixaPlural;
            this.modeloCaixaAltaSingular = camelCase(modeloCaixaBaixaSingular);
            this.modeloCaixaAltaPlural = camelCase(modeloCaixaBaixaPlural);
        }

    }
    class Campo {
        tipo = '';
        nome = '';
        label = '';
        tamanho = 50;
        requerido = false;
        nullable = true;
        unsigned = false;
        chave_primaria = false;
        chave_estrangeira = false;
        comentario = '';
        constructor(nome,
            tipo,
            tamanho,
            label,
          ) {
            this.tipo = tipo;
            this.tamanho = tamanho;
            this.nome = nome;
            this.label = label;
        }
    }



    window.onload = function() {

        escondeAccordions();

    }

    function escondeAccordions() {
        if (modelo_definido) {
            document.getElementById('form-modelo').classList.toggle('invisible');
            document.getElementById('form-campos').classList.toggle('invisible');
        }
    }

    function addModelo() {
        modelo_definido = true;
        let titulo_modelo_singular = obterValorCampo('modelosingular');
        let titulo_modelo_plural = obterValorCampo('modeloplural');
        console.log(titulo_modelo_singular, titulo_modelo_plural);
        modelo = new Modelo(titulo_modelo_singular, titulo_modelo_singular);
        modeloAtual = modelo;
        lista_modelos.push(modelo);
        modelo_definido = true;
        escondeAccordions()
        exibirModelo();
    }

    function addCampo() {
        console.log(document.getElementById('campo_nome'));
     let campo = new Campo(
        toSnakeCase(document.getElementById('campo_nome').value),
        document.getElementById('campo_tipo').value,
        document.getElementById('campo_tamanho').value,
        document.getElementById('campo_label').value
     );
     campo.requerido = document.getElementById('campo_requerido').value,
        campo.nullable = document.getElementById('campo_nullable').value,
        campo.unsigned = document.getElementById('campo_unsigned').value,
        campo.primaria = document.getElementById('chave_primaria').value,
        campo.estrangeira = document.getElementById('chave_estrangeira').value

     modeloAtual.campos.push(campo);
        escondeAccordions();
        exibirModelo();
    }


    function exibirModelo(){
        const texto = document.createTextNode(modeloAtual.modeloCaixaAltaSingular);
      modeloAtual.campos.forEach(function(c){
          let campos = document.createTextNode(c.label + ": "+c.nome);
          document.getElementById("campos_display").appendChild(campos);
      });
        document.getElementById("modelo_display").appendChild(texto);
    }
    function obterValorCampo(campo) {
        retorno = '';
        let inputs = document.querySelectorAll("input");
        inputs.forEach(function(item) {
            if (item.getAttribute('name').includes(campo)) {
                retorno = item.value;
            }
        });
        return retorno;

    }
</script>
@endsection
