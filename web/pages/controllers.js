/*app = angular.module('app', []);

app.controller('controller', function($scope, $http) 
{
    $scope.filtrarPor = "nombreADSL";
    $scope.modemSeleccionado;
    $scope.modoEdicion = false;
    $scope.urlWS = "../WS/modemsWS.jsp";
    $scope.urlAddMode = "?action=add";
    $scope.urlUpdateMode = "?action=update";
    $scope.urlActionFormulario= $scope.urlWS + $scope.urlAddMode ;
    $scope.loaded = false;
    
    $http.get($scope.urlWS + "?action=list").then(function(response) 
    {
        console.log(response);
        $scope.modems = response.data;
        $scope.loaded = true;
        
        $scope.pedirUsuarioSugerido();
    });
    
    $scope.pedirUsuarioSugerido = function()
    {
       $http.get("../WS/sugerenciaUsuarioADSLWS.jsp").then(function(response) 
        {
            console.log("Usuario sugerido: " + response.data);
            $scope.modemSeleccionado = response.data;
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
        $scope.urlActionFormulario= $scope.urlWS + $scope.urlUpdateMode ;
    }
    $scope.modoAlta = function()
    {
        $scope.modemSeleccionado = null;
        $scope.modoEdicion = false;
        $scope.urlActionFormulario= $scope.urlWS + $scope.urlAddMode ;
        $scope.pedirUsuarioSugerido();
    }
    $scope.borrarModem = function(modem)
    {
        if(confirm("Seguro que queres borrar : " + modem.id +" | "+  modem.usuario +" | "+ modem.observaciones))
        {
            $("tr").each(function(index,element)
            {
                var obj = $(element).data("modem");

                if(obj != null)
                {
                    //console.log(obj  +" | " + obj.id);
                    if(modem.id == obj.id)
                    {
                        $(element).remove();

                        console.log("elimino " + modem.id + "," + modem.usuario);
                    }
                }
            });
        }
        else
        {
            console.log("conservo " + modem.id);
        }
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
});*/