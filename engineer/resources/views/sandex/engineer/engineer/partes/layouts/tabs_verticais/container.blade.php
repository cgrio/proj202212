<div class="d-flex align-items-start">
	<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home"
			type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Strings Template</button>
		@for ($i = 1; $i < count($lista_itens_crud);$i++) <button class="nav-link" id="v-pills-{{$i}}-tab"
			data-bs-toggle="pill" data-bs-target="#v-pills-{{$i}}" type="button" role="tab"
			aria-controls="v-pills-{{$i}}" aria-selected="false">{{$lista_itens_crud[$i]->nome_arquivo}}</button>
			@endfor

	</div>
	<div class="tab-content" id="v-pills-tabContent">
		<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"
			tabindex="0">
@if($lista_strings_templates)
    @for ($i = 1; $i < count($lista_strings_templates);$i++)

    @php if(str_contains($lista_strings_templates[$i], "(")):

        $valor = substr($lista_strings_templates[$i], strpos($lista_strings_templates[$i],"(") +1 ,strrpos($lista_strings_templates[$i],")") - strpos($lista_strings_templates[$i],"(") -1);
        @endphp

        @include('sandex.engineer.engineer.partes.formulario.textarea', [ 'campo'=>
            str_replace("§","",$lista_strings_templates[$i])."-{$i}",
            'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
            'required'=>'required',
            'autofocus'=>'',
            'value'=> $valor
            ])
        @else
            @include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
            str_replace("§","",$lista_strings_templates[$i])."-{$i}",
            'placeholder'=>
            str_replace("§","",$lista_strings_templates[$i]),
            'campo_label'=> str_replace("§","",$lista_strings_templates[$i]),
            'required'=>'required',
            'autofocus'=>'',
            'value'=> ''
            ])
        @endif
    @endfor
@endif



		</div>
		@for ($i = 1; $i < count($lista_itens_crud);$i++) <div class="tab-pane fade" id="v-pills-{{$i}}" role="tabpanel"
			aria-labelledby="v-pills-{{$i}}-tab" tabindex="0">
			<div class="textwrapper"><textarea class="textarea100">{{$lista_itens_crud[$i]->conteudo}}</textarea>
			</div>
	</div>
	@endfor
</div>
</div>
@section('styles')
<style type="text/css">
	.textarea100 {
		width: 100%;
		height: 100%;
		background-color: blue;
	}
	.tab-pane {
		height: 100%;
		width: 100%;

	}

	.tab-content {
		display: block;
		background-color: #999999;
		height: 100%;
		width: 100%;
        box-shadow: 1px 1px 1px cyan, 0 0 10px blue, 0 0 5px darkblue;
        box-shadow: 1px 1px 1px rgb(0 180 180 / 55%), 0 0 5px rgb(0 255 0/ 55%), 0 0 3px rgb(0 255 255 / 55%);
        padding: 20px 30px;
        border-radius: 5px 10px 10px 5px;
	}
	.textwrapper {
		border: 1px solid #999999;
		margin: 5px 0;
		padding: 3px;
		display: block;
		background-color: #999999;
		height: 100%;
		width: 100%;
	}
</style>
@endsection
