<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body ng-app="app" ng-controller="controller">
        
        <!-- banner -->
        <%@include file="banner.jsp" %>
        
        <!-- jumbo
        <div id="jumbo" class=" container">
            <button type="button" class="close" data-dismiss="modal" onclick="$('#jumbo').hide('slow');">&times;</button>
            <h3 class="hx col-xs-4 col-xs-offset-4" style='display: block;'>Esta seccion es para generar entradas VPN para agencias..</h3>   
            
        </div>-->
            
        
        <!--<div class="container" ng-include="'gridModem.jsp'"></div>-->
        
        <div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)">

            <!-- BOTONERA: -->
            <div ng-include="'botoneraModems.jsp'"></div>
            <!-- GRID -->
            <div>
                <div class="form-group">
                    <label></label>
                    <input type="search" class="form-control" placeholder="Busqueda rapida.." ng-model="filtro" autofocus>
                </div>
                
                
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
            <!-- IMG ESPERA: -->
            <img src='res/img/progress.gif' ng-hide='loaded' class='col-xs-4 col-xs-offset-4 img-thumbnail img-responsive'>
            <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>Cargando..</h3>        

            <!-- BOTONERA: -->
            <div ng-include="'botoneraModems.jsp'"></div>

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

                                <button class="btn btn-success form-control" ng-hide="modoEdicion" ng-click="addModem()"><span class="glyphicon glyphicon-ok" ></span> Cargar Nuevo Modem</button>
                                <button class="btn btn-primary form-control" ng-show="modoEdicion" ng-click="updateModem()"><span class="glyphicon glyphicon-pencil"></span> Editar Modem</button>
                            <!--</form>-->
                        </div>

                    </div>
                </div>
            </div>
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
        
    </body>
    <script>
        app = angular.module('app', []);

        app.controller('controller', function($scope, $http) 
        {
            $scope.filtrarPor = "nombreADSL";
            
            $scope.modemSeleccionado;
            $scope.modoEdicion = false;
            
            $scope.urlWS = "../WS/modemsWS.jsp";
            $scope.urlAddMode = $scope.urlWS + "?action=add";
            $scope.urlUpdateMode = $scope.urlWS +"?action=update";
            $scope.urlRemoveMode = $scope.urlWS + "?action=delete";
            $scope.loaded = false;
            
            $scope.logok = false;
            $scope.lognok = false;
            $scope.registro = "";
            $scope.errores = "";
            $scope.log = function(que)
            {
                $scope.registro = que;
                $scope.logok = true;
                $scope.lognok = false;
            }
            $scope.error = function(que)
            {
                $scope.errores = que;
                $scope.logok = false;
                $scope.lognok = true;
            }
            $scope.listarModems = function()
            {
                console.log("listando modems..")
                //$scope.log("listando modems..");
                $.ajax({url:$scope.urlWS + "?action=list",async: false, beforeSend: function (xhr)
                {
                    $scope.loaded = false;
                }}).done(function(response)
                {
                    //console.log("Listado: " + response);
                    $scope.modems = JSON.parse(response);
                    
                    if($scope.modems != null)
                    {
                        $scope.loaded = true;  
                    }
                    
                    $scope.pedirUsuarioSugerido();
                    
                });
            }
            $scope.pedirUsuarioSugerido = function()
            {
                $.ajax({url:"../WS/sugerenciaUsuarioADSLWS.jsp"}).done(function(response)
                {
                    //console.log("Usuario sugerido: " + response);
                    
                    $scope.modemSeleccionado = JSON.parse(response);
                    
                    //$scope.log("modemSelecionado:" + $scope.modemSeleccionado.nombreADSL );
                    
                });
            }
            $scope.cambiarFiltro  = function(filtro)
            {
                $scope.filtrarPor = filtro;
                console.log("cambiarFiltro:" + filtro);
            };
            $scope.seleccionarModem = function(modem)
            {
                console.log("modem seleccionado = " + modem);
                $scope.modemSeleccionado = modem;
                $scope.modoEdicion = true;
            }
            $scope.modoAlta = function()
            {
                //$scope.modemSeleccionado = null;
                $scope.pedirUsuarioSugerido();
                $scope.modoEdicion = false;
                
            }     
            $scope.validarIP = function()
            {
                todoCorrecto = true;
                entrada = $("#inputIP");
                texto = $(entrada).val();

                console.log("IP escrita:" + texto);

                vectorTexto = texto.split(".");

                for(i = 0 ; i < vectorTexto.length;i++ )
                {
                    if(isNaN(vectorTexto[i]))
                    {
                        todoCorrecto = false;
                        console.log("No es numero : " + i);
                    }
                    else if(parseInt(vectorTexto[i]) > 254 )
                    {
                        todoCorrecto = false;
                       console.log("No es ip : " + i);
                    }


                    if(vectorTexto[i].length > 3)
                    {
                        todoCorrecto = false;
                        console.log("No es ip : " + i);
                    }
                }
                console.log("modoEdicion: "  + $scope.modoEdicion);
                if(!$scope.modoEdicion)
                {
                    $.ajax({url:"../WS/existeIPWS.jsp",data:{"ip":texto},async: false}).done(function(response)
                    {
                        console.log("response:" + response);

                        if(response=="true")
                        {
                            todoCorrecto = false;
                        }
                    });
                }


                if(todoCorrecto)
                {
                    $(entrada).css("border","solid 2px green");
                    return true;
                }
                else
                {
                    $(entrada).css("border","solid 2px red");
                    return false;
                }

                console.log(vectorTexto);

            }
            $scope.verifverificarTodosLosCampos = function()
            {
                console.log(validarIP());

                if(validarIP())
                {
                    return true;
                }
                else
                {
                    return false;
                }   
            }
            $scope.addModem = function()
            {
                console.log("addModem");
                //ValidarFormatoIP();
                //ValidarIPExiste();
                //ValidarNombreADSL();
                //ValidarObservaciones();
                
                console.log("modemSeleccionado:"  + JSON.stringify($scope.modemSeleccionado));
                
                $.ajax({url:$scope.urlAddMode,async: false,data:{"modem": JSON.stringify($scope.modemSeleccionado)}}).done(function(response)
                {
                    console.log(response);
                    
                    $('#modalModems').modal('hide');
                    
                    $scope.listarModems();
                    
                    if(response.trim() == "true")
                    {
                        $scope.log($scope.modemSeleccionado.nombreADSL + " agregado satisfactoriamente!");
                    }
                    else
                    {
                        $scope.error($scope.modemSeleccionado.nombreADSL + " no se pudo agregar.");
                    }
                });
                $scope.pedirUsuarioSugerido();
            }
            $scope.borrarModem = function(modem)
            {
                if(confirm("Seguro que queres borrar : " + modem.nombreADSL +" > "+ modem.observaciones))
                {
                    $("tr").each(function(index,element)
                    {
                        var obj = $(element).data("modem");

                        if(obj != null)
                        {
                           //console.log(obj  +" | " + obj.nombreADSL);
                           
                            if(modem.nombreADSL == obj.nombreADSL)
                            {
                                $(element).remove();
                                    
                                console.log("url:" + $scope.urlRemoveMode);
                                
                                $.ajax({url:$scope.urlRemoveMode,async: false,data: {"modem":JSON.stringify(modem)}}).done(function(response)
                                {
                                    console.log("eliminé " + modem.nombreADSL + " = " + response );
                                    
                                    if(response.trim() == "true")
                                    {
                                        $scope.log(modem.nombreADSL + " borrado con exito!");
                                    }
                                    else
                                    {
                                        $scope.error(modem.nombreADSL + " no se pudo borrar.");
                                    }
                                    
                                });    
                            }
                        }
                    });
                }
                else
                {
                    //console.log("conservo " + modem.id);
                }
                $scope.pedirUsuarioSugerido();
            }
            $scope.updateModem = function()
            {
                console.log("update modem: " + $scope.modemSeleccionado.nombreADSL);
                
                $('#modalModems').modal('hide');
                
                $.ajax({url:$scope.urlUpdateMode,data:{"modem": JSON.stringify($scope.modemSeleccionado)},async: false}).done(function(response)
                {
                    console.log("response:" + response);
                    if(response.trim() == "true")
                    {
                        $scope.log($scope.modemSeleccionado.nombreADSL + " updateado satisfactoriamente!");
                    }
                    else
                    {
                        $scope.error($scope.modemSeleccionado.nombreADSL + " no se pudo updatear.");
                    }
                });                
            }
            
            //HACER AL INICIO:
            $scope.listarModems();
        });
    </script>
</html>
