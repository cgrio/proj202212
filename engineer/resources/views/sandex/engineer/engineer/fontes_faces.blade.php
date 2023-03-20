@extends('layouts.puro')
    @php
        /*
        * Google Font Importer
        */
        $fonts_url = "https://www.googleapis.com/webfonts/v1/webfonts?key=AIzaSyCpfnm5kVng8hhP_jnAnnTXVP7MEUM89-k";
        $fonts = file_get_contents($fonts_url, 0, null, null);
        $fp = fopen('fonts.txt', 'w');
        fwrite($fp, $fonts);
        fclose($fp);
        $fonts = json_decode($fonts);
    @endphp
    @section('styles')
    <style type="text/css">
div#conteudo{
    font-size:30px;
}
    </style>
    @endsection
    @section('content')
    <div class="content-fluid">
    <div class="container" id="conteudo">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            @php foreach ( $fonts->items as $font ) { @endphp
                <link href="http://fonts.googleapis.com/css?family={!! str_replace(' ', '+', $font->family); !!}" rel="stylesheet" />
                <div style="font-family: '{{$font->family}}', Arial, sans-serif!important;" >
                    @php foreach ( $font->variants as $variant ) { @endphp
                            <div style="font-weight:{{preg_replace('/[a-zA-Z]/', '', $variant)?preg_replace('/[a-zA-Z]/', '', $variant):200 }};
                            font-style:{{preg_replace('/[0-9]/', '', $variant) =='italic' ? preg_replace('/[0-9]/', '', $variant):'normal' }};">
                            {!! $font->family !!} {{preg_replace("/[^A-Za-z]/", '', $variant)?'('.preg_replace("/[^A-Za-z]/", '', $variant).')':''}} {{preg_replace("/[^0-9]/", '', $variant)}} - A raposa não come plástico, Inconstitucionalissimamente, Teste Alessandro BRABO BRAST ALVCOR Alvcor alvcor
                                </div>
                    @php } @endphp
                </div>
                @php } @endphp

    </div>
    </div>
@endsection

