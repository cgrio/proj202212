<div class="row mb-3">
    <label for="{!! $campo !!}" class="col-md-4 col-form-label text-md-end">{!! $campo_label !!}</label>

    <div class="col-md-6">
        @foreach($valores as $valor)
        <label for="{!! $campo . $valor !!}" class="form-check-label">
            <input id="{!!$campo . $valor !!}" type="checkbox" class="form-check-input @error('{!!$campo!!}') is-invalid @enderror" name="{!! $campo !!}[]" value="{!! $valor !!}" autocomplete="{!! $campo !!}" {!! $autofocus !!} @if($valor==$value) checked @endif>
            {!! $valor !!}</label>
        @endforeach
        @error('{!! $campo !!}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
