<div class="row mb-3">
    <label for="{!! $campo !!}" class="col-md-4 col-form-label text-md-end">{!! $campo_label !!}</label>

    <div class="col-md-6">
        <select id="{!! $campo !!}" class="form-control @error('{!! $campo !!}') is-invalid @enderror" name="{!! $campo !!}" {!! $required !!} autocomplete="{!! $campo !!}" {!! $autofocus !!}>
            <option value=''></option>

            @foreach($valores as $valor)
            <option value='{!! $valor !!}'>{!! $valor !!}</option>
            @endforeach
            @endphp
        </select>
        @error('{!! $campo !!}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
