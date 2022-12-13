<div class="d-flex align-items-start">
	<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		@if($lista_strings_templates)
		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_menu',[
		'label'=> 'Template Strings',
		'id'=> 'a0',
		'active'=> 'active',
		'selected_boolean'=> 'true',
		])
		@endif
		@if($lista_itens_crud)
		@for ($i = 1; $i < 3; $i++) @php $var_label=$lista_itens_crud[$i]->nome_arquivo;
			@endphp

			@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_menu',[ 'label'=>
			$var_label,
			'id'=>'a'.$i,
			'active'=> '',
			'selected_boolean'=> 'false',
			])
			@endfor
			@endif
	</div>
	<div class="tab-content" id="v-pills-tabContent">
		@if($lista_strings_templates)

		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_painel',[
		'conteudo'=> 'Formulário de Strings Templates',
		'id'=> 'a0',
		'active'=> 'active'
		])
		@endif
		@if($lista_itens_crud)

		@for ($i = 1; $i < 3; $i++)
			@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_painel',[ 'conteudo'=>'
			<pre>'.
                $lista_itens_crud[$i]->conteudo . '</pre>',
			'id'=> 'a'.$i,
			'active'=> ''
			])
			@endfor
			@endif


	</div>
</div>
