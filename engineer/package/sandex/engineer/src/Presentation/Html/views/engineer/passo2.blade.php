@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="engineer-content">
                <div class="div-head">
                    <p class="h2">Passo 2</p>
                </div>
                <div class="div-body">
                    <p class="text">Por onde vamos começar a gerar códigos automatizados? Preencha as informações:
                        abaixo:</p>
                    <form method="POST" action="/engineer/passo3">
                        @csrf
                        <div class="">

    <div class="row mb-3">
<label for="pacote-1" class="col-md-4 col-form-label text-md-end">pacote</label>

<div class="col-md-6">
<input id="pacote-1" placeholder="pacote" type="text" class="form-control " name="pacote-1" value="" required="" autocomplete="pacote-1">
</div>
</div>

    <div class="row mb-3">
<label for="Fornecedor-2" class="col-md-4 col-form-label text-md-end">Fornecedor</label>

<div class="col-md-6">
<input id="Fornecedor-2" placeholder="Fornecedor" type="text" class="form-control " name="Fornecedor-2" value="" required="" autocomplete="Fornecedor-2">
</div>
</div>

    <div class="row mb-3">
<label for="Pacote-3" class="col-md-4 col-form-label text-md-end">Pacote</label>

<div class="col-md-6">
<input id="Pacote-3" placeholder="Pacote" type="text" class="form-control " name="Pacote-3" value="" required="" autocomplete="Pacote-3">
</div>
</div>

    <div class="row mb-3">
<label for="ModeloSingular-4" class="col-md-4 col-form-label text-md-end">ModeloSingular</label>

<div class="col-md-6">
<input id="ModeloSingular-4" placeholder="ModeloSingular" type="text" class="form-control " name="ModeloSingular-4" value="" required="" autocomplete="ModeloSingular-4">
</div>
</div>

    <div class="row mb-3">
<label for="modelosingular-5" class="col-md-4 col-form-label text-md-end">modelosingular</label>

<div class="col-md-6">
<input id="modelosingular-5" placeholder="modelosingular" type="text" class="form-control " name="modelosingular-5" value="" required="" autocomplete="modelosingular-5">
</div>
</div>

    <div class="row mb-3">
<label for="ModeloPlural-6" class="col-md-4 col-form-label text-md-end">ModeloPlural</label>

<div class="col-md-6">
<input id="ModeloPlural-6" placeholder="ModeloPlural" type="text" class="form-control " name="ModeloPlural-6" value="" required="" autocomplete="ModeloPlural-6">
</div>
</div>

    <div class="row mb-3">
<label for="modeloplural-7" class="col-md-4 col-form-label text-md-end">modeloplural</label>

<div class="col-md-6">
<input id="modeloplural-7" placeholder="modeloplural" type="text" class="form-control " name="modeloplural-7" value="" required="" autocomplete="modeloplural-7">
</div>
</div>


<div class="row mb-3">
<label for="listabaseadatemplate($table->££campotipo££('££camponome££')->nullable()->unique();)-8" class="col-md-4 col-form-label text-md-end">listabaseadatemplate($table-&gt;££campotipo££('££camponome££')-&gt;nullable()-&gt;unique();)</label>

<div class="col-md-6">
<textarea id="listabaseadatemplate($table->££campotipo££('££camponome££')->nullable()->unique();)-8" type="text" class="form-control " name="listabaseadatemplate($table->££campotipo££('££camponome££')->nullable()->unique();)-8" value="$table->££campotipo££('££camponome££')->nullable()->unique();" required="" autocomplete="listabaseadatemplate($table->££campotipo££('££camponome££')->nullable()->unique();)-8">$table-&gt;££campotipo££('££camponome££')-&gt;nullable()-&gt;unique();</textarea>

</div>
</div>


<div class="row mb-3">
<label for="listabaseadatemplate($entity->££camponome££ = $this->££camponome££;)-9" class="col-md-4 col-form-label text-md-end">listabaseadatemplate($entity-&gt;££camponome££ = $this-&gt;££camponome££;)</label>

<div class="col-md-6">
<textarea id="listabaseadatemplate($entity->££camponome££ = $this->££camponome££;)-9" type="text" class="form-control " name="listabaseadatemplate($entity->££camponome££ = $this->££camponome££;)-9" value="$entity->££camponome££ = $this->££camponome££;" required="" autocomplete="listabaseadatemplate($entity->££camponome££ = $this->££camponome££;)-9">$entity-&gt;££camponome££ = $this-&gt;££camponome££;</textarea>

</div>
</div>


<div class="row mb-3">
<label for="listabaseadatemplate(public ££campotipo££ $££camponome££;)-10" class="col-md-4 col-form-label text-md-end">listabaseadatemplate(public ££campotipo££ $££camponome££;)</label>

<div class="col-md-6">
<textarea id="listabaseadatemplate(public ££campotipo££ $££camponome££;)-10" type="text" class="form-control " name="listabaseadatemplate(public ££campotipo££ $££camponome££;)-10" value="public ££campotipo££ $££camponome££;" required="" autocomplete="listabaseadatemplate(public ££campotipo££ $££camponome££;)-10">public ££campotipo££ $££camponome££;</textarea>

</div>
</div>


<div class="row mb-3">
<label for="listabaseadatemplate($££modelosingular££->££camponome££ = $request->££camponome££;)-11" class="col-md-4 col-form-label text-md-end">listabaseadatemplate($££modelosingular££-&gt;££camponome££ = $request-&gt;££camponome££;)</label>

<div class="col-md-6">
<textarea id="listabaseadatemplate($££modelosingular££->££camponome££ = $request->££camponome££;)-11" type="text" class="form-control " name="listabaseadatemplate($££modelosingular££->££camponome££ = $request->££camponome££;)-11" value="$££modelosingular££->££camponome££ = $request->££camponome££;" required="" autocomplete="listabaseadatemplate($££modelosingular££->££camponome££ = $request->££camponome££;)-11">$££modelosingular££-&gt;££camponome££ = $request-&gt;££camponome££;</textarea>

</div>
</div>



</div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')

@endsection
