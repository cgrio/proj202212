<div class="row">
    <div class="col-3">
        <!-- Tab navs -->
        <div class="nav flex-column nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            @include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_menu',[
            'label'=> 'label',
            'id'=> 'id',
            'active'=> 'active',
            'selected_boolean'=> false,
            ])
        </div>
        <!-- Tab navs -->
    </div>

    <div class="col-9">
        <!-- Tab content -->
        <div class="tab-content" id="v-pills-tabContent">
            @include('sandex.engineer.engineer.partes.layouts.tabs_verticais.partes.tab_painel',[
            'conteudo'=> 'conteudo',
            'id'=> 'id',
            'active'=> 'active'
            ])
        </div>
        <!-- Tab content -->
    </div>
</div>
