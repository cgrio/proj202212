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
			tabindex="0">...</div>
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
	}

	.tab-pane {
		height: 90vh;
		width: 100%;
	}

	.textwrapper {
		border: 1px solid #999999;
		margin: 5px 0;
		padding: 3px;
		height: 100%;
		width: 100%;
	}
</style>
@endsection
