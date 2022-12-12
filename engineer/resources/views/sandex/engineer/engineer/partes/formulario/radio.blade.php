<div class="row mb-3">
    <label for="{!! $campo !!}" class="col-md-4 col-form-label text-md-end">{!! $campo_label !!}</label>

    <div class="col-md-6">
        @foreach($valores as $a)
        <input id="{!! $campo . $a !!}" type="radio" class="form-check-input @error('{!! $campo !!}') is-invalid @enderror" name="{!! $campo !!}" {!! $required !!} $value={{$a}} autocomplete="{!! $campo !!}" value="{{$a}}" {!! $autofocus !!} @if($value==$a) checked @endif>
        <label for="{!! $campo . $a !!}" class="form-check-label">
            {!! $a !!}</label>

        @endforeach

        @error('{!! $campo !!}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
