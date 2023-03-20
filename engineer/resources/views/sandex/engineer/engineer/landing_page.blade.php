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
                .div-sdxdrop{
                    height:30px;
            width:200px;
            background:lightgray;
            position:relative;
        }
        .estilo-input {
    box-shadow: inset 1px 1px 1px rgb(0 180 180 / 55%), inset 0 0 5px rgb(0 180 255/ 55%), inset 0 0 3px rgb(0 255 255 / 55%);
    border-radius: 5px;
}
.item-sdxdrop, .selected-sdxdrop{
    display:block;
    height:30px;
    width:100%;position:relative;
    background:gray;
            transition:all 0.6s;
            line-height:30px;
        }
        .selected-sdxdrop{
            background:none;
            display:block;
        }
        .item-sdxdrop:hover{
            background:lightgray;
        }
        .drop-css{
            position:absolute;
            top:0;
            right:0;
            height:100%;
            width:30px;
            background:#c0c0c0;
            transition:all 0.4s;
            transform:rotate(0deg);
        }
        </style>
    @endsection
    @section('content')
    <div class="content-fluid">
    <div class="container">
        <div class="div-sdxdrop">
            <span class="selected-sdxdrop estilo-input">1</span>
            <span class="drop-css"></span>

            @php for ($i=0; $i <count($fonts->items); $i = $i + 50 ) { @endphp
                @php foreach ( $fonts->items[$i]->variants as $variant ) { @endphp
                    <link
  href="https://fonts.googleapis.com/css?family={!! str_replace(' ', '+', $fonts->items[$i]->family); !!}&text={!! str_replace(' ', '+', $fonts->items[$i]->family); !!}" rel="stylesheet" />
                    <span class="item-sdxdrop" value="{{$fonts->items[$i]->family}}">
                        <span
                        style="font-family: {!! $fonts->items[$i]->family!!};"

                        >
                        {!! $fonts->items[$i]->family !!} {{preg_replace("/[^A-Za-z]/", '', $variant)?'('.preg_replace("/[^A-Za-z]/", '', $variant).')':''}} {{preg_replace("/[^0-9]/", '', $variant)}}
                    </span>
                </span>
                    @php } @endphp

                @php } @endphp



            </div>
        </div>
    </div>
    <div id="landing">
    @include('sandex.engineer.engineer.partes.email_template' )
    </div>
    @endsection
    @section('scripts')
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script>
        function addStylesheetURL(url) {
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.href = url;
        document.getElementsByTagName('head')[0].appendChild(link);
        }
        // Load Tangerine & Cantarell
        //addStylesheetURL('https://fonts.googleapis.com/css2?family=Cantarell&family=Tangerine&display=swap');

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
        $('.item-sdxdrop').hide();
        $('.item-sdxdrop').click(function () {
            var x = $(this).attr('value');
            $(this).siblings(".selected-sdxdrop").text(x);
            console.log(x);
            $("div#landing *, div#landing").css("font-family", x);
            $(this).slideUp().siblings(".item-sdxdrop").slideUp();
        });
        $('.drop-css').click(function () {
            $(this).parent().toggleClass("opened-sdxdrop");
            $(this).siblings(".item-sdxdrop").slideToggle();
        });
        $('.selected-sdxdrop').click(function () {
            $(this).parent().removeClass("opened-sdxdrop");
            $(this).siblings(".item-sdxdrop").slideUp();
        });
    </script>

@endsection
