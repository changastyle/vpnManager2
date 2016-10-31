<div id="modalModems" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- HEADER MODAL:-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" ng-click="modoAlta()">&times;</button>
                <h4 class="modal-title" ng-hide="modoEdicion">Alta Nuevo Modem</h4>
                <h4 class="modal-title" ng-show="modoEdicion">Edicion Modem</h4>
            </div>

            <!-- CUERPO MODAL: -->
            <div class="modal-body">
                
                <!-- IMG CARGA:-->
                <img src="../res/img/progress.gif" ng-hide="cargoSugerido || modoEdicion" class="img-thumbnail">
                
                <!-- WRAP FORMULARIO: -->
                <div class="wrap-formulario-modems" ng-show="cargoSugerido || modoEdicion">
                    
                    <!-- NOMBRE USUARIO:-->
                    <div class="form-group">
                        <label>Usuario:</label>
                        <input type="text" class="form-control" placeholder="Nombre.." name="usuario" ng-model="seleccionado.nombreADSL" ng-readonly="modoEdicion" required>
                    </div>

                    <!-- DIRECCION IP:-->
                    <div class="form-group">
                        <label>Direccion IP:</label>
                        <input type="text" id="inputIP" class="form-control" placeholder="xxx.xxx.xxx.xxx"  name="direccionIP" ng-keyDown="validarIP()" ng-keyUp="validarIP()" ng-model="seleccionado.direccionIP"   required><!--ng-readonly="modoEdicion"-->
                    </div>
                    
                    <!-- REINTENTOS:-->
                    <div class="form-group">
                        <label>Cant. Reintentos:</label>
                        <select class="form-control" ng-model="seleccionado.reintentos" ng-options="reintento for reintento in reintentos">
                        </select>
                    </div>

                    

                    
                    <!-- OBSERVACIONES: -->
                    <div class="form-group">
                        <label>Observaciones:</label>
                        <textarea class="form-control" id="textAreaObservaciones" placeholder="Descripcion del VPN.." ng-model="seleccionado.observaciones" autofocus rows="3">
                        </textarea>
                        <!--<input type="text" class="form-control" placeholder="Descripcion del VPN.." name="observaciones" ng-model="seleccionado.observaciones" autofocus required>-->
                    </div>

                    
                    <button class="btn btn-success form-control" ng-hide="modoEdicion" ng-click="addModem()">
                        <span class="glyphicon glyphicon-ok" ></span> 
                        Cargar Nuevo Modem
                    </button>
                    <button class="btn btn-primary form-control" ng-show="modoEdicion" ng-click="updateModem()">
                        <span class="glyphicon glyphicon-pencil"></span> 
                        Editar Modem
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../res/css/estiloFormularioModems.css">