app = angular.module('app', []);

        app.controller('controller', function($scope, $http) 
        {
            $scope.filtrarPor = "nombreADSL";
            
            $scope.modemSeleccionado = {"nombreADSL" :"NICO" , "direccionIP" : "192.168.1.1" ,"observaciones" : "se la come" , "reintentos" : 0};
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
                //console.log("listando modems..");
                $.ajax(
                {
                    url:$scope.urlWS + "?action=list",
                    async: false,
                    beforeSend: function (xhr)
                    {
                        $scope.loaded = false;
                    },
                    success: function (resultado, textStatus, jqXHR) 
                    {
                        $scope.modems = JSON.parse(resultado);
                    
                        if($scope.modems != null)
                        {
                            $scope.loaded = true;  
                        }
                        $scope.pedirUsuarioSugerido();
                    }
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
                console.log("modem seleccionado = " + JSON.stringify(modem));
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
            $scope.verificarTodosLosCampos = function()
            {
                console.log($scope.validarIP());

                if($scope.validarIP())
                {
                    return true;
                }
                else
                {
                    return false;
                }   
            }
            $scope.submit = function()
            {
                console.log("SUBMIT: modoEdicion -> " + $scope.modoEdicion);
                
                if(!$scope.modoEdicion)
                {
                    $scope.addModem();
                }
                else
                {
                    $scope.updateModem();
                }
            }
            $scope.addModem = function()
            {
                console.log("addModem: " + $scope.verificarTodosLosCampos());
                
                if($scope.verificarTodosLosCampos())
                {
                    console.log("modemSeleccionado:"  + JSON.stringify($scope.modemSeleccionado));

                    $.ajax(
                    {
                        url:$scope.urlAddMode,
                        async: false,
                        data:{"modem": JSON.stringify($scope.modemSeleccionado)},
                        beforeSend: function (xhr) 
                        {
                            $('#modalModems').modal('hide');
                        },
                        success: function (resultado, textStatus, jqXHR) 
                        {
                            console.log(resultado);
                            
                            if(resultado.trim() == "true")
                            {
                                $scope.listarModems();
                                $scope.log($scope.modemSeleccionado.nombreADSL + " agregado satisfactoriamente!");
                            }
                            else
                            {
                                $scope.error($scope.modemSeleccionado.nombreADSL + " no se pudo agregar.");
                            }
                        }
                    });
                    $scope.pedirUsuarioSugerido();
                }
                
                
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