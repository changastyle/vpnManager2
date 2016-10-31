<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body ng-app="app" ng-controller="controller">
        
        <!-- banner -->
        <%@include file="banner.jsp" %>
       
        <!-- CONTAINER -->
        <div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)">
       
            <!-- NOTIFICACIONES: -->
            <!-- LOG -->
            <div id="botonera">
                <div class="alert alert-success col-xs-12" style="margin-top: 15px;" ng-show='logok'>
                    <button type="button" class="close" onclick="$('#botonera').hide('slow');">&times;</button>
                    {{registro}}
                </div>

                <!-- LOG ERRORES: -->
                <div class="alert alert-danger col-xs-12" ng-show='lognok'>
                    <button type="button" class="close" onclick="$('#botonera').hide('slow');">&times;</button>
                   {{errores}}
                </div>
            </div>
            
            
            <!-- SEARCH BAR -->
            <div>
                <div class="form-group">
                    <br>
                    <div class="col-xs-8">
                        <input type="search" class="form-control" placeholder="Busque modems rapidamente aquí.." ng-model="filtro" autofocus>
                    </div>
                    <div class="col-xs-4">
                        <button class="btn btn-success col-xs-6" data-toggle="modal" data-target="#modalModems" ng-click="pedirUsuarioSugerido()">
                            <span class="glyphicon glyphicon-plus"></span> Agregar Modem
                        </button>
                        <button class="btn btn-warning col-xs-5 col-xs-offset-1"  data-toggle="modal" data-target="#modalConsola"  ng-click="pedirConsola()">
                            <span class="glyphicon glyphicon-console"></span> Log de radius
                        </button>
                    </div>
                </div>
                
                <!-- GRID -->
                <div class="col-xs-12">
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
                </div>
            </div>
            
            <!-- IMG ESPERA: -->
            <div class="col-xs-4 col-xs-offset-4" ng-hide='loaded' style="background-color:rgba(0,0,0,0.25);">
                <img src='res/img/progress.gif' class='img-thumbnail img-responsive'>
                <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>Cargando..</h3>     
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
                            <form ng-submit="submit()">
                                <div class="form-group">
                                    <label>Nombre:</label>
                                    <input type="text" ng-model="modemSeleccionado.nombreADSL" class="form-control" placeholder="Nombre.." required ng-readonly="modoEdicion">
                                </div>
                                <div class="form-group">
                                    <label>Direccion IP:</label>
                                    <input type="text" ng-model="modemSeleccionado.direccionIP" class="form-control" placeholder="Direccion IP.."
                                           id="inputIP" ng-keypress="validarIP()" ng-keyup="validarIP()" required
                                           >
                                </div>
                                <div class="form-group">
                                    <label>Observaciones:</label>
                                    <input type="text" ng-model="modemSeleccionado.observaciones" class="form-control" placeholder="Observaciones.." required ng-readonly="modoEdicion" autofocus>
                                </div>
                                <div class="form-group">
                                    <label>Reintentos:</label>
                                    <input type="number" ng-model="modemSeleccionado.reintentos" class="form-control" placeholder="Reintentos.." min="-1" max="3">
                                </div>
                                <div class="form-group">
                                    <button type="submit"  class="btn btn-success form-control" ng-hide="modoEdicion">
                                        <span class=""></span> Agregar Modem
                                    </button>
                                    <button type="submit" class="btn btn-primary form-control" ng-show="modoEdicion">
                                        <span class=""></span> Update Modem
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!-- CONSOLA -->
            <div id="modalConsola" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="hx">Log de radius..</h3>
                        </div>
                        <div class="modal-body">
                            <div id="consola">
                                lsasdfjasdkñflajksdlfjakdslflk
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script src="res/javascript/angularControllerModems.js"></script>
</html>
