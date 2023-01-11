
@extends('layouts.app')
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
            select {

            }
            select optgroup {
            color:black;
            font-size: 1em;
            line-height: 10px;
            margin: 0;
            padding: 0;
            border: 1px solid blue;
            }

            select option {
                line-height: 0px;
                border:1px solid green;
            }
        </style>

@endsection
@section('content')
<div class="content-fluid">
<div class="container">

        <select id="font-selector" style="font-family: '{!! $fonts->items[0]->family !!}', Arial,​ sans-serif;" >
            @php foreach ( $fonts->items as $font ) { @endphp
            <optgroup style="font-family: '{{$font->family; }}', Arial,​ sans-serif;" data-src="http://fonts.googleapis.com/css?family={!! str_replace(' ', '+', $font->family); !!}&text={!! str_replace(' ', '+', $font->family); !!}">
                {!! $font->family !!}
                @php foreach ( $font->variants as $variant ) { @endphp
                         <option value="{{str_replace(' ', '+', $variant); }}">  {!! $font->family !!} ({!! $variant !!})</option>
                @php } @endphp
            </optgroup>
            @php } @endphp
        </select>
</div>
</div>



@endsection
@section('scripts')
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
function addStylesheetURL(url) {
  var link = document.createElement('link');
  link.rel = 'stylesheet';
  link.href = url;
  document.getElementsByTagName('head')[0].appendChild(link);
}

// Load Tangerine & Cantarell
addStylesheetURL('https://fonts.googleapis.com/css2?family=Cantarell&family=Tangerine&display=swap');

</script>

<script>
            $( document ).ready(function() {

                setTimeout( function() {

                    $.each( $("#font-selector optgroup"), function() {

                        var src = $(this).data( "src" );
                        $('head').append("<link href='" + src + "' rel='stylesheet' type='text/css'>");

                    });

                }, 0);

                $("#font-selector").change(function() {
                    var selected = $("#font-selector option:selected").text();
                    $(this).css( 'font-family', selected );
                });

            });
        </script>
@endsection
