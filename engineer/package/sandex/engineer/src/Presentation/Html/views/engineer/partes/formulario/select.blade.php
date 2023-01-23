<div class="row mb-3">
    <label for="{!! $campo !!}" class="col-md-4 col-form-label text-md-end">{!! $campo_label !!}</label>

    <div class="col-md-6">
        <select id="{!! $campo !!}" class="form-control @error('{!! $campo !!}') is-invalid @enderror" name="{!! $campo !!}" {!! $requerido !!} autocomplete="{!! $campo !!}" {!! $autofocus !!}>
            <option value=''></option>

@foreach($valores as $chave=>$valor)
            <option value='{!! $chave !!}' @if($chave == $value) selected @endif>{!! $valor !!}</option>
            @endforeach
        </select>
        @error('{!! $campo !!}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
