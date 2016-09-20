<div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)">
    
    <!-- BOTONERA: -->
    <div class="row col-xs-12">
        <div class="alert alert-success col-xs-12" ng-show='logok'>
            {{registro}}
        </div>
        <div class="alert alert-danger col-xs-12" ng-hide='lognok'>
           {{errores}}
        </div>
        <button class="btn btn-success" data-toggle="modal" data-target="#modalModems" style='margin-top: 12px;margin-bottom: 12px;'><span class="glyphicon glyphicon-plus"></span> Agregar Nuevo Modem</button>
    
    </div>
    
    <!-- GRID -->
    <input type="search" class="form-control" placeholder="Busqueda rapida.." ng-model="filtro" autofocus>
    <table class="table table-responsive table-hover" style="margin-top: 10px;">
        <thead>
            <tr>
                <td class="table-headers" ng-click="cambiarFiltro('nombreADSL')"><span class="glyphicon glyphicon-filter"></span> Nombre ADSL</td>
                <td class="table-headers" ng-click="cambiarFiltro('direccionIP')"><span class="glyphicon glyphicon-filter"></span> Direccion IP</td>
                <td class="table-headers" ng-click="cambiarFiltro('observaciones')"><span class="glyphicon glyphicon-filter"></span> Observaciones</td>
                <td class="table-headers" ng-click="cambiarFiltro('reintentos')"><span class="glyphicon glyphicon-filter"></span> Reintentos</td>
                <td class="table-headers"><span class="glyphicon glyphicon-remove"></span> Borrar</td>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="modem in modems | filter:filtro | orderBy:filtrarPor" data-modem="{{modem}}">
                <td><button class="btn btn-default" data-bind="{{modem}}" ng-click="seleccionarModem(modem)" data-toggle="modal" data-target="#modalModems"><span class="glyphicon glyphicon-pencil"></span> {{modem.nombreADSL}}</button></td>
                <td valign="middle">{{modem.direccionIP}}</td>
                <td valign="middle">{{modem.observaciones}}</td>
                <td valign="middle">{{modem.reintentos}}</td>
                <td><button class="btn btn-danger" data-bind="{{modem}}" ng-click="borrarModem(modem)"><span class="glyphicon glyphicon-remove"></span></button></td>
            </tr>
        </tbody>
    </table>
    
    <!-- IMG ESPERA: -->
    <img src='res/img/progress.gif' ng-hide='loaded' class='col-xs-4 col-xs-offset-4 img-thumbnail img-responsive'>
    <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>Cargando..</h3>        
    
    <!-- BOTONERA: -->
    <div class="row col-xs-12" >
        <button class="btn btn-success" data-toggle="modal" data-target="#modalModems" style='margin-top: 12px;margin-bottom: 12px;'><span class="glyphicon glyphicon-plus"></span> Agregar Nuevo Modem</button>
    </div>

    <!-- MODAL -->
    <div id="modalModems" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" ng-click="modoAlta()">&times;</button>
                    <h4 class="modal-title" ng-hide="modoEdicion">Alta Nuevo Modem</h4>
                    <h4 class="modal-title" ng-show="modoEdicion">Edicion Modem</h4>
                </div>
                
                <div class="modal-body">
                    <!--<form method="post" action='{{urlActionFormulario}}'>-->
                        <div class="form-group">
                            <label>Usuario:</label>
                            <input type="text" class="form-control" placeholder="Nombre.." name="usuario" ng-model="modemSeleccionado.nombreADSL" ng-readonly="modoEdicion" required>
                        </div>
                        <div class="form-group">
                            <label>Reintentos:</label>
                            <input type="number" class="form-control" placeholder="Reintentos.." name="reintentos" ng-model="modemSeleccionado.reintentos" required min="-1" max="3">
                        </div>
                        <div class="form-group">
                            <label>Observaciones:</label>
                            <input type="text" class="form-control" placeholder="Descripcion del VPN.." name="observaciones" ng-model="modemSeleccionado.observaciones" autofocus required>
                        </div>
                        <div class="form-group">
                            <label>Direccion IP:</label>
                            <input type="text" id="inputIP" class="form-control" placeholder="xxx.xxx.xxx.xxx"  name="direccionIP" ng-keyDown="validarIP()" ng-keyUp="validarIP()" ng-model="modemSeleccionado.direccionIP"  ng-readonly="modoEdicion" required>
                        </div>
                        
                        <button class="btn btn-success form-control" ng-hide="modoEdicion" ng-click="addModem()"><span class="glyphicon glyphicon-ok" data-dismiss="modal"></span> Cargar Nuevo Modem</button>
                        <button class="btn btn-primary form-control" ng-show="modoEdicion"><span class="glyphicon glyphicon-pencil" data-dismiss="modal"></span> Editar Modem</button>
                    <!--</form>-->
                </div>
                
            </div>
        </div>
    </div>
    
</div>