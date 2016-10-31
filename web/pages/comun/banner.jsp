<div class="container-fluid banner" >
    
    <!-- IZQ BANNER:-->
    <div class="text-banner col-md-3 col-sm-3 col-xs-0 partes-banner izq-banner"> 
        <a href="../home/home.jsp" id="enlace-izq">VPN Manager</a>
    </div>
      
    <!-- MED BANNER:-->
    <div class="col-md-6 col-sm-6 col-xs-12 partes-banner mid-banner">
        
        <%@include file="nav.jsp" %>
        
        <!-- BARRA BUSQUEDA:-->
        <div class="input-group">
            <input type="search" class="form-control" placeholder="Busqueda.." id="barraBusquedaMaestra" ng-model="busquedaMaestra">
           <span class="input-group-addon">
               <span class="glyphicon glyphicon-search"></span> 
           </span>
        </div>
    </div>
    
    <!-- DER BANNER:-->
    <div class='col-sm-3 col-xs-12 partes-banner der-banner'>
        
        <div class="btn-group" role="group" aria-label="...">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove"></span> 
                SALIR
            </button>
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-user"></span> 
                LOGIN
            </button>
        </div>
    </div>
    
</div>
    
<link rel="stylesheet" href="../res/css/estiloBanner.css">