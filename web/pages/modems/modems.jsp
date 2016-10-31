<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../comun/comun.jsp"%>
    </head>
    <body ng-app="app" ng-controller="modems" ng-init="init()" ng-cloak>
        
        <!-- BANNER -->
        <%@include file="../comun/banner.jsp" %>
        
        <div class="container" ><!--style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)-->

            <!-- BOTONERA: -->
            <%@include file="botoneraModems.jsp" %>
            
            <!-- GRID -->
            <%@include file="grillaModems.jsp" %>
            
            <!-- IMG ESPERA: -->
            <%@include file="../comun/loading.jsp" %>      

            <!-- BOTONERA: -->
            <%@include file="botoneraModems.jsp" %>
            
            <!-- MODAL -->
            <%@include file="formularioModems.jsp" %>
            
            <!-- LOG:-->
            <%@include file="../comun/log.jsp" %>
        </div>
    </body>
    <script>
        app = angular.module('app', []);

        app.controller('modems', function($scope, $rootScope) 
        {
            $scope.filtrarPor = "nombreADSL";
            
            $scope.seleccionado = {};
            $scope.modoEdicion = false;
            
            $scope.reintentos = [-1,0,1,2,3];
            $scope.urlWS = "../../findModems";
            $scope.urlAddMode = $scope.urlWS + "?action=add";
            $scope.urlUpdateMode = $scope.urlWS +"?action=update";
            $scope.urlRemoveMode = $scope.urlWS + "?action=delete";
            $scope.loaded = false;
            $scope.cargoSugerido = false;
            
            $scope.logok = false;
            $scope.lognok = false;
            $scope.registro = "";
            $scope.errores = "";
            $scope.log = function(que)
            {
                $scope.registro = que;
                $scope.logok = false;
                $scope.lognok = false;
            }
            $scope.error = function(que)
            {
                $scope.errores = que;
                $scope.logok = false;
                $scope.lognok = true;
            }
            $scope.init = function()
            {
                $scope.listarModems();
            }
            $scope.listarModems = function()
            {
                console.log("listando modems..")
                $scope.log("listando modems..");
                $.ajax(
                {
                    url: $scope.urlWS,
                    beforeSend: function (xhr)
                    {
                        $scope.loaded = false;
                    }
                    ,success: function (resultado, textStatus, jqXHR) 
                    {
                        //console.log(JSON.stringify(resultado));
                        $scope.modems = resultado;
                        $scope.loaded = true;
                        $scope.$apply();
                    }
                });
            }
            $scope.pedirUsuarioSugerido = function()
            {
                $.ajax(
                {
                    url:"../../sugerirUsuarioADSL",
                    beforeSend: function (xhr) {
                        $scope.cargoSugerido = false;
                    },
                    success: function (resultado, textStatus, jqXHR) 
                    {
                        console.log("usuario sugerido: " + JSON.stringify(resultado));
                        $scope.seleccionado = resultado;
                        $scope.cargoSugerido = true;
                        $scope.$apply();
                        
                        //MUESTRO MODAL:
                        //$("#modalModems").modal();
                    }
                })
            }
            $scope.cambiarFiltro  = function(filtro)
            {
                $scope.filtrarPor = filtro;
                console.log("cambiarFiltro:" + filtro);
            };
            $scope.seleccionarModem = function(modem)
            {
                console.log("modem seleccionado = " + modem);
                $scope.seleccionado = modem;
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
                /*if(!$scope.modoEdicion)
                {*/
                    $.ajax(
                    {
                        url:"../../existeIP",
                        data:{"ip":texto}
                        ,success: function (response, textStatus, jqXHR) 
                        {
                            console.log("existeIP: " + JSON.stringify(response));

                            if(response)
                            {
                                todoCorrecto = false;
                                
                                $(entrada).css("border","solid 2px red");
                                return false;
                                
                            }
                        }
                    });
                /*}*/


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
                
                console.log("modemSeleccionado:"  + JSON.stringify($scope.seleccionado));
                
                $.ajax(
                {
                    url: "../../addModem",
                    data:{"modem": JSON.stringify($scope.seleccionado)},
                    success: function (resultado, textStatus, jqXHR) 
                    {
                        console.log("RES ADD MODEM: " + resultado);
                        $('#modalModems').modal('hide');
                        
                        if(resultado)
                        {
                            $scope.log($scope.seleccionado.nombreADSL + " agregado satisfactoriamente!");
                            $scope.listarModems();
                        }
                        else
                        {
                            $scope.error($scope.seleccionado.nombreADSL + " no se pudo agregar.");
                        }
                    }
                });
                $scope.pedirUsuarioSugerido();
            }
            $scope.borrarModem = function(modem)
            {
                if(confirm("Seguro que queres borrar : " + modem.nombreADSL +" > "+ modem.observaciones))
                {
                   $.ajax(
                    {
                       url:"../../rmModem",
                       data:
                        {
                            "modem": JSON.stringify(modem)
                        },
                        success: function (resultado, textStatus, jqXHR)
                        {
                            console.log("borre modem " + resultado);
                            $scope.listarModems();
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
                console.log("update modem: " + $scope.seleccionado.nombreADSL);
                
                $('#modalModems').modal('hide');
                
                console.log("updateando " + JSON.stringify($scope.seleccionado));
                
                $.ajax(
                {
                    url: "../../updateModem",
                    data:
                    {
                        "modem": JSON.stringify($scope.seleccionado)
                    },
                    success: function (response, textStatus, jqXHR) 
                    {
                        console.log("response:" + response);
                        
                        if(response)
                        {
                            $scope.log($scope.seleccionado.nombreADSL + " updateado satisfactoriamente!");
                            $scope.listarModems();
                        }
                        else
                        {
                            $scope.error($scope.seleccionado.nombreADSL + " no se pudo updatear.");
                        }
                    }
                });                
            }
        });
    </script>
</html>
