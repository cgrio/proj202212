@extends('layouts.app')
@section('content')
<div class="container">


	<div class="row justify-content-center">

    <form method="POST" action="{{ route('login') }}">
        @csrf
        <input id="acao" placeholder="acao" type="text"
			class="form-control" name="acao"
			value="revisar">

		@include('sandex.engineer.engineer.partes.layouts.tabs_verticais.container')

    </form>
    </div>
</div>
@endsection
