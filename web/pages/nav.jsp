<ul class="nav nav-tabs" style="text-align: center;margin-top:15px;margin-bottom:15px;">
    <li class="col-xs-3 tabs" style="overflow: hidden"><a class="nav-item " href="home.jsp">Home</a></li>
    <li class="col-xs-3 tabs" style="overflow: hidden"><a class="nav-item " href="modems.jsp">ADSL's</a></li>
    <li class="col-xs-3 tabs" style="overflow: hidden"><a class="nav-item " href="usuarios.jsp">Usuarios VPN</a></li>
    <li class="col-xs-3 tabs" style="overflow: hidden"><a class="nav-item " href="extra.jsp">Extra</a></li>
</ul>

<script>
    $(document).ready(function()
    {
        //Procesa la URL Actual:
        urlActual = window.location.href;
        vectorSplit = urlActual.split("/");
        urlActual = vectorSplit[ (vectorSplit.length - 1) ];

        console.log( "ready: " + urlActual);

        //console.log("items:" + $(".tabs").length);
        
        $(".tabs").each(function(index,element)
        {
            href = $(element).children("a").attr("href");
            if( href === urlActual)
            {
                //console.log("esta: " + href);
                $(element).addClass("active");
            }
            //console.log($(element).children("a").attr("href"));
        });

    });
</script>
