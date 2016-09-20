<div id="botonera" class="row col-xs-12">
    
    <!-- LOG -->
    <div class="alert alert-success col-xs-12" style="margin-top: 15px;" ng-show='logok'>
        <button type="button" class="close" onclick="$('#botonera').hide('slow');">&times;</button>
        {{registro}}
    </div>
    
    <!-- LOG ERRORES: -->
    <div class="alert alert-danger col-xs-12" ng-show='lognok'>
        <button type="button" class="close" onclick="$('#botonera').hide('slow');">&times;</button>
       {{errores}}
    </div>
    
    <!--BOTONES:-->
    <button class="btn btn-success" ng-click="pedirUsuarioSugerido()" data-toggle="modal" data-target="#modalModems">
        <span class="glyphicon glyphicon-plus"></span> 
        Agregar Nuevo Modem
    </button>
    <button class="btn btn-warning" data-toggle="modal" data-target="#modalConsola" style='margin-top: 12px;margin-bottom: 12px;' ng-click="pedirConsola()"><span class="glyphicon glyphicon-console"></span> Log de radius</button>

    <!--{{modemSeleccionado}}-->
</div>