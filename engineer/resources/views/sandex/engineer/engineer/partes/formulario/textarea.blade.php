<div class="row mb-3">
    <label for="{{$campo}}" class="col-md-4 col-form-label text-md-end">{{$campo_label}}</label>

    <div class="col-md-6">
        <textarea id="{{$campo}}" type="text" class="form-control @error('{{$campo}}') is-invalid @enderror" name="{{$campo}}" value="{!! $value !!}" {{ $required}} autocomplete="{{$campo}}" {{$autofocus}}>{{ $value }}</textarea>

        @error('{{$campo}}')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>
