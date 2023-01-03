<div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
  Campos
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
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
      </div>
    </div>
  </div>
