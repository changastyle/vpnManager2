<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#EEAE2E" />
<link rel="icon" href="../res/img/icon_vpn.png">
<title>COMUN</title>


<!-- FRAMEWORKS:-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="../res/frameworks/jquery.js"></script>
<script src="../res/frameworks/bootrapJS.js"></script>
<script src="../res/frameworks/angular.js"></script>

<!-- ESTILOS COMUNES:-->


<!-- FONTS COMUNES:-->
<style>
@font-face 
{
    font-family: Prototype;
    src: url(../res/fonts/Prototype.ttf);
}
</style>
<!-- ROOT SCOPE: -->
<script>
    app = angular.module('app',[]).run(function($rootScope) 
    {
        $rootScope.redireccionamiento = function(url)
        {
            window.location.href = url;
        }
    });
</script>