@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        @dd($lista_itens_crud);
        @include('sandex.engineer.engineer.partes.layouts.tabs_verticais.container',[
        'label'=> 'label',
        'id'=> 'id',
        'active'=> 'active',
        'selected_boolean'=> false,
        ])
    </div>
</div>
@endsection