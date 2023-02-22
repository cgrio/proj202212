<?php

$dir = "C:\\Users\\alecg\\Downloads\\XML\\XML\\";
$files = scandir($dir);
$relatorio = [];
$relatorio[] = ['CPF', 'arquivo', 'Sign-1', 'Sign-2', 'Sign-3', 'Sign-4', 'Sign-5', 'Sign-6'];
$results = [];

foreach ($files as $key => $value) {
    $path = realpath($dir . DIRECTORY_SEPARATOR . $value);

    if (!is_dir($path)) {
        $results[] = $path;
    }
}

foreach ($results as $file) {
    $string_do_arquivo = file_get_contents($file);
    $xml = new DOMDocument();
    $xml->loadXML($string_do_arquivo);
    $cpfs = $xml->getElementsByTagName('CPF');

    $qtd_assinatura1 = substr_count($string_do_arquivo, 'Id="Sign-1"');
    $qtd_assinatura2 = substr_count($string_do_arquivo, 'Id="Sign-2"');
    $qtd_assinatura3 = substr_count($string_do_arquivo, 'Id="Sign-3"');
    $qtd_assinatura4 = substr_count($string_do_arquivo, 'Id="Sign-4"');
    $qtd_assinatura5 = substr_count($string_do_arquivo, 'Id="Sign-5"');
    $qtd_assinatura6 = substr_count($string_do_arquivo, 'Id="Sign-6"');
    $relatorio[] = [
        $cpfs[0]->nodeValue, pathinfo($file)['filename'] . "." . pathinfo($file)['extension'],
        "$qtd_assinatura1",  "$qtd_assinatura2",  "$qtd_assinatura3",
        "$qtd_assinatura4",  "$qtd_assinatura5",  "$qtd_assinatura6"
    ];
}


$fp = fopen('file.csv', 'w');

foreach ($relatorio as $fields) {
    fputcsv($fp, $fields);
}

fclose($fp);
