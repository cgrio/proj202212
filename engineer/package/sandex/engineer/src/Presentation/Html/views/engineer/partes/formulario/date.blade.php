<div class="row mb-3">
    <label for="{{$campo}}" class="col-md-4 col-form-label text-md-end">{{ __('{{$campo_label}') }}</label>

    <div class="col-md-6">
        <input id="{{$campo}}" type="date" class="form-control @error('{{$campo}}') is-invalid @enderror" name="{{$campo}}"  value="{!! $value !!}"  {{ $requerido}} autocomplete="{{$campo}}" {{$autofocus}}>

        @error('{{$campo}}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
