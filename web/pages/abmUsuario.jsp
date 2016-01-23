<div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px; margin-top: 15px;">
    <input type="search" class="form-control" placeholder="Busqueda rapida.." ng-model="filtro" autofocus>
    <table class="table table-responsive table-hover table-striped" style="margin-top: 10px;">
        <thead>
            <tr>
                <td class="table-headers" ng-click="cambiarFiltro('id')"><span class="glyphicon glyphicon-filter"></span> ID</td>
                <td class="table-headers" ng-click="cambiarFiltro('usuario')"><span class="glyphicon glyphicon-filter"></span> Usuario</td>
                <td class="table-headers" ng-click="cambiarFiltro('observaciones')"><span class="glyphicon glyphicon-filter"></span> Observaciones</td>
                <td class="table-headers" ng-click="cambiarFiltro('direccionIP')"><span class="glyphicon glyphicon-filter"></span> Direccion IP</td>
                <td class="table-headers">Borrar</td>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="modem in modems | filter:filtro | orderBy:filtrarPor" data-modem="{{modem}}">
                <td><button class="btn btn-default" data-bind="{{modem}}" ng-click="seleccionarModem(modem)" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span> {{modem.id}}</button></td>
                <td>{{modem.usuario}}</td>
                <td>{{modem.observaciones}}</td>
                <td>{{modem.direccionIP}}</td>
                <td><button class="btn btn-danger" data-bind="{{modem}}" ng-click="borrarModem(modem)"><span class="glyphicon glyphicon-remove"></span> Borrar</button></td>
            </tr>
        </tbody>
    </table>
        
    <div class="row">
        <button class="btn btn-success" data-toggle="modal" data-target="#myModal"><span class=""></span> Agregar Nuevo Modem</button>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" ng-click="modoAlta()">&times;</button>
                    <h4 class="modal-title" ng-hide="modoEdicion">Alta Nuevo Modem</h4>
                    <h4 class="modal-title" ng-show="modoEdicion">Edicion Modem</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label>Usuario:</label>
                            <input type="text" class="form-control" placeholder="Nombre.." ng-model="modemSeleccionado.id">
                        </div>
                        <div class="form-group">
                            <label>Observaciones:</label>
                            <input type="text" class="form-control" placeholder="Descripcion del VPN.." ng-model="modemSeleccionado.observaciones">
                        </div>
                        <div class="form-group">
                            <label>Direccion IP:</label>
                            <input type="text" class="form-control" placeholder="xxx.xxx.xxx.xxx" ng-model="modemSeleccionado.direccionIP">
                        </div>
                        <button type="submit" class="btn btn-success form-control" ng-hide="modoEdicion"><span></span> Cargar Nuevo Modem</button>
                        <button type="submit" class="btn btn-primary form-control" ng-show="modoEdicion"><span></span> Editar Modem</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>