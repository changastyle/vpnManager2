<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body ng-app="app" ng-controller="controller">
        
        <%@include file="banner.jsp" %>
        
        
        <!--<div class="container" ng-include="'abmModem.jsp'"></div>-->
        <div class="panel col-xs-4 col-xs-offset-4" style="background-color:rgba(255,255,255,0.8)">
            <img src="res/img/vpn.png" class="img-thumbnail img-responsive" style="margin-top:12px;">
            <h3 class="hx">Bienvenido al VPN Manager de Tecnoaccion.</h3>
            <h5 class="hx">Esta aplicacion web, permite el ingreso a la red interna de usuarios ajenos, mediante un tunel VPN.</h5>
        </div>
        <div class="row" hidden>
            <a href="modems.jsp"><img src="res/img/modem.png" class="col-xs-3 col-xs-offset-2 img-thumbnail img-responsive"></a>
            <a href="usuarios.jsp"><img src="res/img/usuario.png" class="col-xs-3 col-xs-offset-2 img-thumbnail img-responsive"></a>
        </div>
    </body>
</html>
