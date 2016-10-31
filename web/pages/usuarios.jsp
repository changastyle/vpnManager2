<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body ng-app="app" ng-controller="controllerUsuarios">
        
        <!-- BANNER:  -->
        <%@include file="banner.jsp" %>
        
        <div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)">
            
            <!--<h3 class="hx col-xs-4 col-xs-offset-4">Esta seccion es para personal interno de Tecnoaccion..</h3>   
            <img src="res/img/construccion.png" class="col-xs-4 col-xs-offset-4 img-thumbnail img-responsive">
            <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>En Construccion..</h3>   -->
            <div class="form-group">
                <br>
                <div class="col-xs-8">
                    <input type="search" class=" form-control " placeholder="Busque usuarios rapidamente aquí.." ng-model="filtroUsuarios" autofocus>
                </div>
                <div class="col-xs-4">
                    <button class="btn btn-success col-xs-6"><span class="glyphicon glyphicon-plus"></span> Agregar Usuario</button>
                    <button class="btn btn-warning col-xs-5 col-xs-offset-1"><span class="glyphicon glyphicon-console"></span> Log de radius</button>
                </div>
                
            </div>
            <div class="col-xs-12">
                <img src="res/img/progress.gif" ng-hide="loadedUsuarios" class="col-xs-4 col-xs-offset-4 img-thumbnail img-responsive">
                <table class="table table-responsive table-hover" style="margin-top: 10px;" >
                    <thead>
                        <tr>
                            <td class="col-xs-1" ng-click="cambiarFiltro('nombre')"><span class="glyphicon glyphicon-filter"></span> Nombre</td>
                            <td class="col-xs-5" ng-click="cambiarFiltro('password')"><span class="glyphicon glyphicon-filter"></span> Contraseña</td>
                            <td class="col-xs-5" ng-click="cambiarFiltro('reintentos')"><span class="glyphicon glyphicon-filter"></span> Reintentos</td>
                            <td class="col-xs-1"><span class="glyphicon glyphicon-filter"></span> Borrar</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="usuario in usuarios | filter : filtroUsuarios | orderBy : filtrarPor">
                            <td class="col-xs-1"><button class="btn btn-default form-control" data-bind="{{usuario}}"><span class="glyphicon glyphicon-pencil"></span> {{usuario.nombre}}</button></td>
                            <td class="col-xs-5">{{usuario.password}}</td>
                            <td class="col-xs-5">{{usuario.reintentos}}</td>
                            <td class="col-xs-1"><button class="btn btn-danger" ng-click="deleteUsuario()" data-bind="{{usuario}}"><span class="glyphicon glyphicon-remove"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        app = angular.module('app',[]);
        
        app.controller('controllerUsuarios',function($scope)
        {
            $scope.usuariosWSURL = "../WS/usuariosWS.jsp";
            $scope.loadedUsuarios = false;
            $scope.usuarios = [];
            $scope.filtrarPor = "nombre";
            $scope.findUsuarios = function()
            {
                $.ajax(
                {
                    url:$scope.usuariosWSURL,
                    beforeSend: function (xhr) 
                    {
                        $scope.loadedUsuarios = false;
                    },
                    success: function (resultado, textStatus, jqXHR)
                    {
                        //console.log("resultado: " + resultado);
                        $scope.usuarios = JSON.parse(resultado);
                        $scope.loadedUsuarios = true;
                        $scope.$apply();
                    }
                });
            }
            $scope.cambiarFiltro  = function(filtro)
            {
                $scope.filtrarPor = filtro;
                console.log("cambiarFiltro:" + filtro);
            };
            
            $scope.findUsuarios();
        });
    </script>
</html>
