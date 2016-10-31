<div class="col-xs-12" id="wrap-grilla-modems">
    <table class="table table-responsive table-hover" id="grillaModems" ng-show="loaded" ng-hide="!loaded">
        <thead>
            <tr>
                <th class="table-headers" ng-click="cambiarFiltro('nombreADSL')">
                    <span class="glyphicon glyphicon-filter"></span> Nombre ADSL
                </th>
                <th class="table-headers" ng-click="cambiarFiltro('direccionIP')">
                    <span class="glyphicon glyphicon-filter"></span> Direccion IP
                </th>
                <th class="table-headers" ng-click="cambiarFiltro('observaciones')">
                    <span class="glyphicon glyphicon-filter"></span> Observaciones
                </th>
                <th class="table-headers" ng-click="cambiarFiltro('reintentos')">
                    <span class="glyphicon glyphicon-filter"></span> Reintentos
                </th>
        </thead>
        <tbody>
            <tr ng-repeat="modem in modems | filter:busquedaMaestra | orderBy:filtrarPor" data-modem="{{modem}}">
                <td><button class="btn btn-default" data-bind="{{modem}}" ng-click="seleccionarModem(modem)" data-toggle="modal" data-target="#modalModems"><span class="glyphicon glyphicon-pencil"></span> {{modem.nombreADSL}}</button></td>
                <td valign="middle">{{modem.direccionIP}}</td>
                <td valign="middle">{{modem.observaciones}}</td>
                <td valign="middle">{{modem.reintentos}}</td>
                <td><button class="btn btn-danger" data-bind="{{modem}}" ng-click="borrarModem(modem)"><span class="glyphicon glyphicon-trash"></span>  BORRAR</button></td>
            </tr>
        </tbody>
    </table>
</div>

<link rel="stylesheet" href="../res/css/estiloGrillaModems.css">