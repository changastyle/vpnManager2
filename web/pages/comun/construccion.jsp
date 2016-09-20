<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body ng-app="app" ng-controller="controller">
        
        <%@include file="banner.jsp" %>
        
        <img src="res/img/construccion.png" class="col-xs-4 col-xs-offset-4 img-thumbnail img-responsive">
        <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>En Construccion..</h3>   
        
    </body>
</html>