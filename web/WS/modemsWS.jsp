<%@page import="com.google.gson.Gson"%>
<%@page import="model.Modem"%>
<% 
    String action = request.getParameter("action");
    
    if(action != null)
    {
        if(action.equalsIgnoreCase("list"))
        {
            out.print("[");

            java.util.ArrayList<model.Modem> arr = daos.ModemsDAO.findAll();

            int contador = 0;

            for(model.Modem modem : arr)
            {
                out.print( modem.toJSON() );

                if(contador < arr.size() - 1)
                {
                    out.print(",");
                }

                contador++;
            }

            out.print("]");
        }
        else if(action.equalsIgnoreCase("add"))
        {
            //out.print("add mode");
            
            String modem = request.getParameter("modem");
            
            if(modem != null)
            {
                Gson gson = new Gson();
                Modem modemRecibido = gson.fromJson(modem, Modem.class);
                //out.print( "Modem recibido: " + modemRecibido );
                Modem aux = new Modem(modemRecibido.getNombreADSL(), modemRecibido.getDireccionIP(), modemRecibido.getReintentos(), modemRecibido.getObservaciones());
                //out.print( "Modem parseado: " + aux );
                out.print( daos.ModemsDAO.save(aux) );
            }
            else
            {
                out.print("faltan parametros..");
            }
        }
        else if(action.equalsIgnoreCase("update") || action.equalsIgnoreCase("edit"))
        {   
            String jsonRecibido = request.getParameter("modem");
            //out.print(jsonRecibido);
            
            Gson gson = new Gson();
            Modem modemRecibido = gson.fromJson(jsonRecibido, Modem.class);
            
            Modem aux = daos.ModemsDAO.findByName(modemRecibido.getNombreADSL()).get(0);
            aux.setObservaciones(modemRecibido.getObservaciones());
            aux.setReintentos(modemRecibido.getReintentos());
            aux.setDireccionIP(modemRecibido.getDireccionIP());
            
            out.print(daos.ModemsDAO.update2(aux));
        }
    
        else if(action.equalsIgnoreCase("delete") || action.equalsIgnoreCase("remove"))
        {
            
            Gson gson = new Gson();
            
            out.print(daos.ModemsDAO.delete(gson.fromJson(request.getParameter("modem"), Modem.class).getNombreADSL()));
        }
    }
    

%>