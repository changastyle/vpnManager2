<%-- 
    Document   : footer
    Created on : 08/04/2016, 17:50:42
    Author     : NICOLAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="head.jsp"%>
    <style>
        footer
        {
            background-color:#204d74;
            color:white;
            position:absolute;
            bottom: 0px;
            margin-top:  25px;
        }
        #headerFooter
        {
            background-color:rgba(0,0,0,0.25);
            border-radius: 5px;
            margin-top:15px;
            margin-bottom:15px;
        }
        .columasFooter
        {
            background-color:rgba(0,0,0,0.25);
            border-radius: 5px;
            //box-shadow: 5px 5px 5px black;
        }
    </style>    
    <footer class="col-xs-12">
        <div class="col-xs-10 col-xs-offset-1" id="headerFooter"><center><h3 class="hx">VPN MANAGER | Tecnoaccion | Grossi Nicolas 2016</h3></center></div>
        <div class="col-xs-2 col-xs-offset-1 columasFooter">
            <img src="res/img/vpn.png" class="img-circle img-responsive">
            <center>ajdkslfjalsdjkl</center>
        </div>
        <div class="col-xs-2 col-xs-offset-2 columasFooter">
            <img src="res/img/vpn.png" class="img-circle img-responsive">
            <center>ajdkslfjalsdjkl</center>
        </div>
        <div class="col-xs-2 col-xs-offset-2 columasFooter">
            <img src="res/img/vpn.png" class="img-circle img-responsive">
            <center>ajdkslfjalsdjkl</center>
        </div>
        <div class="col-xs-10 col-xs-offset-1" id="headerFooter"><center><h3 class="hx">Visitas Totales:119004</h3></center></div>
        
    </footer>
</html>
