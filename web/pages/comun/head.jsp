<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>VPN Manager | Tecnoaccion.</title>
    <link rel="icon" href="res/img/icon_vpn.png"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    
    <!-- FONTS: -->
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cinzel+Decorative' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Press+Start+2P' rel='stylesheet' type='text/css'>
    <style>
        
        h3
        {
            font-size: 24px;
        }
        h5
        {
            font-size: 16px;
        }
        .hx
        {
            font-family: 'Lobster', cursive;
            //font-family: 'Cinzel Decorative', cursive;
            //font-size: 24px;
            text-align: center;
        }
        .text-banner
        {
            font-family: 'Cinzel Decorative', cursive;
            font-size: 24px;
            text-align: center;
        }
        .banner
        {
            /*background: #ffd65e;
            background: -moz-linear-gradient(top,  #ffd65e 0%, #febf04 100%);
            background: -webkit-linear-gradient(top,  #ffd65e 0%,#febf04 100%);
            background: linear-gradient(to bottom,  #ffd65e 0%,#febf04 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffd65e', endColorstr='#febf04',GradientType=0 );
              */  
              background-color:rgba(0,0,0,0.85);
              margin-bottom: 15px;
            //padding:4px;
        }
        .btn-login
        {
            float:right;
        }
        table
        {
            text-align: center;
            font-family: 'Roboto', sans-serif;
            font-size:16px;
            padding-top:4px;
        }
        .btn
        {
            font-family: 'Roboto', sans-serif;
            font-size:16px;
        }
        .table-headers
        {
            text-align: center;
            cursor:pointer;
        }
        body
        {
            background-image: url('res/img/bg4.jpg');
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: cover;
        }
        a:hover
        {
            text-decoration: none;
        }
        .jumbo
        {
            background-color:#EEEEEE;
        }
        #consola
        {
            background-color: black;
            color:white;
            font-family: 'Press Start 2P', cursive;
            font-size:12px;
            height: 250px;
            width: 100%;
        }
    </style>
    
    <script src='controllers.js'></script>
    <script>
        $(document).ready(function()
        {
            //Procesa la URL Actual:
            urlActual = window.location.href;
            vectorSplit = urlActual.split("/");
            urlActual = vectorSplit[ (vectorSplit.length - 1) ];
            
            console.log( "ready: " + urlActual);
            
             /*$(".nav-item").each(function(index,element)
             {
                 if($(element).attr("href") == urlActual)
                 {
                    $(element).parent("li").addClass("active");
                    console.log($(element).attr("href"));
                 }
             });
            */
        });
    </script>
</head>