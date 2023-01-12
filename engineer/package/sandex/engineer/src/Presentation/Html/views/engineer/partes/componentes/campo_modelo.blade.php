



@include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
            'campo_nome',
            'placeholder'=>
            'Nome',
            'campo_label'=> 'Nome',
            'requerido'=> 'required',
            'autofocus'=> true,
            'value'=> ''
            ])



@include('sandex.engineer.engineer.partes.formulario.text', [ 'campo'=>
            'campo_label',
            'placeholder'=>
            'Label',
            'campo_label'=> 'Label',
            'requerido'=> 'required',
            'autofocus'=> '',
            'value'=> ''
            ])


            @php
$tipos = [
'bigIncrements',
'bigInteger',
'binary',
'boolean',
'char',
'dateTimeTz',
'dateTime',
'date',
'decimal',
'double',
'enum',
'float',
//'foreignId',
//'foreignIdFor',
//'foreignUlid',
//'foreignUuid',
//'geometryCollection',
'geometry',
'id',
'increments',
'integer',
'ipAddress',
'json',
'jsonb',
'lineString',
'longText',
'macAddress',
'mediumIncrements',
'mediumInteger',
'mediumText',
'morphs',
'multiLineString',
'multiPoint',
'multiPolygon',
'nullableMorphs',
'nullableTimestamps',
'nullableUlidMorphs',
'nullableUuidMorphs',
'point',
'polygon',
'rememberToken',
'set',
'smallIncrements',
'smallInteger',
//'softDeletesTz',
//'softDeletes',
'string',
'text',
'timeTz',
'time',
'timestampTz',
'timestamp',
'timestampsTz',
'timestamps',
'tinyIncrements',
'tinyInteger',
'tinyText',
'unsignedBigInteger',
'unsignedDecimal',
'unsignedInteger',
'unsignedMediumInteger',
'unsignedSmallInteger',
'unsignedTinyInteger',
'ulidMorphs',
'uuidMorphs',
'ulid',
'uuid',
'year'];
@endphp

            @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_tipo',
                        'campo_label'=>'Tipo',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> $tipos,
                        'value'=> ''
                        ])










@include('sandex.engineer.engineer.partes.formulario.number', [ 'campo'=>
            'campo_tamanho',
            'placeholder'=>
            'Tamanho',
            'campo_label'=> 'Tamanho',
            'requerido'=> '',
            'autofocus'=> '',
            'value'=> 255
            ])

            @include('sandex.engineer.engineer.partes.formulario.radio', [
                        'campo'=>'nullable',
                        'campo_label'=>'Permitir Nullo',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['sim','não'],
                        'value'=> 'não'
                        ])


            @include('sandex.engineer.engineer.partes.formulario.radio', [
                        'campo'=>'primary',
                        'campo_label'=>'Chave Primária',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['sim','não'],
                        'value'=> 'não'
                        ])

          @include('sandex.engineer.engineer.partes.formulario.radio', [
                        'campo'=>'unique',
                        'campo_label'=>'Campo Único',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['sim','não'],
                        'value'=> 'não'
                        ])


                        @include('sandex.engineer.engineer.partes.formulario.radio', [
                        'campo'=>'unsigned',
                        'campo_label'=>'Permitir valores Negativos',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['sim','não'],
                        'value'=> 'não'
                        ])


@include('sandex.engineer.engineer.partes.formulario.textarea', [ 'campo'=>
            'campo_comentario',
            'placeholder'=>
            'comentário',
            'campo_label'=> 'Comentário',
            'requerido'=> false,
            'autofocus'=> false,
            'value'=> ''
            ])
