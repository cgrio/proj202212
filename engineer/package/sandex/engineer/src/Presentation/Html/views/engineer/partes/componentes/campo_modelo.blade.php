



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
'bigIncrements'=>'bigIncrements',
'bigInteger'=>'bigInteger',
'binary'=>'binary',
'boolean'=>'boolean',
'char'=>'char',
'dateTimeTz'=>'dateTimeTz',
'dateTime'=>'dateTime',
'date'=>'date',
'decimal'=>'decimal',
'double'=>'double',
'enum'=>'enum',
'float'=>'float',
//'foreignId',
//'foreignIdFor',
//'foreignUlid',
//'foreignUuid',
//'geometryCollection',
'geometry'=>'geometry',
'id'=>'id',
'increments'=>'increments',
'integer'=>'integer',
'ipAddress'=>'ipAddress',
'json'=>'json',
'jsonb'=>'jsonb',
'lineString'=>'lineString',
'longText'=>'longText',
'macAddress'=>'macAddress',
'mediumIncrements'=>'mediumIncrements',
'mediumInteger'=>'mediumInteger',
'mediumText'=>'mediumText',
'morphs'=>'morphs',
'multiLineString'=>'multiLineString',
'multiPoint'=>'multiPoint',
'multiPolygon'=>'multiPolygon',
'nullableMorphs'=>'nullableMorphs',
'nullableTimestamps'=>'nullableTimestamps',
'nullableUlidMorphs'=>'nullableUlidMorphs',
'nullableUuidMorphs'=>'nullableUuidMorphs',
'point'=>'point',
'polygon'=>'polygon',
'rememberToken'=>'rememberToken',
'set'=>'set',
'smallIncrements'=>'smallIncrements',
'smallInteger'=>'smallInteger',
//'softDeletesTz',
//'softDeletes',
'string'=>'string',
'text'=>'text',
'timeTz'=>'timeTz',
'time'=>'time',
'timestampTz'=>'timestampTz',
'timestamp'=>'timestamp',
'timestampsTz'=>'timestampsTz',
'timestamps'=>'timestamps',
'tinyIncrements'=>'tinyIncrements',
'tinyInteger'=>'tinyInteger',
'tinyText'=>'tinyText',
'unsignedBigInteger'=>'unsignedBigInteger',
'unsignedDecimal'=>'unsignedDecimal',
'unsignedInteger'=>'unsignedInteger',
'unsignedMediumInteger'=>'unsignedMediumInteger',
'unsignedSmallInteger'=>'unsignedSmallInteger',
'unsignedTinyInteger'=>'unsignedTinyInteger',
'ulidMorphs'=>'ulidMorphs',
'uuidMorphs'=>'uuidMorphs',
'ulid'=>'ulid',
'uuid'=>'uuid',
'year'=>'year'];
@endphp

            @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_tipo',
                        'campo_label'=>'Tipo',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> $tipos,
                        'value'=> 'string'
                        ])










@include('sandex.engineer.engineer.partes.formulario.number', [ 'campo'=>
            'campo_tamanho',
            'placeholder'=>
            'Tamanho',
            'campo_label'=> 'Tamanho',
            'requerido'=> '',
            'autofocus'=> '',
            'value'=> 50
            ])




                        @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_nullable',
                        'campo_label'=>'Permitir Nullo',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['n'=>'não','s'=>'sim'],
                        'value'=> 'n'
                        ])




                        @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_chave_primaria',
                        'campo_label'=>'É chave primária',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['n'=>'não','s'=>'sim'],
                        'value'=> 'n'
                        ])


                        @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_chave_estrangeira',
                        'campo_label'=>'É chave Estrangeira',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['n'=>'não','s'=>'sim'],
                        'value'=> 'n'
                        ])

          @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_unico',
                        'campo_label'=>'Campo Único',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['n'=>'não','s'=>'sim'],
                        'value'=> 'n'
                        ])



                        @include('sandex.engineer.engineer.partes.formulario.select', [
                        'campo'=>'campo_unsigned',
                        'campo_label'=>'Permitir valores Negativos',
                        'requerido'=>'required',
                        'autofocus'=>'',
                        'valores'=> ['n'=>'não','s'=>'sim'],
                        'value'=> 'n'
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
