<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body>
        
        <%@include file="banner.jsp" %>
        <div class="container" style="box-shadow: 15px 15px 15px black;border-radius: 10px;background-color: rgba(255,255,255,0.8)">
            <img src="res/img/construccion.png" class="col-xs-4 col-xs-offset-4 img-thumbnail img-responsive">
            <h3 class="hx col-xs-4 col-xs-offset-4" ng-hide='loaded'>En Construccion..</h3>   
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>