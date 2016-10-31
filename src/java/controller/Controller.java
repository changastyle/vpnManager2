package controller;

import java.util.regex.Pattern;
import model.Modem;

public class Controller
{
   public static String nombreAdslSugerido()
   {
       String respuesta = "";
       
       int contador = 1;
    
       java.util.ArrayList<model.Modem> arr = daos.ModemsDAO.findAll();
       
        while(true)
        {
            boolean existe = false;
            for(Modem modem : arr)
            {
                String nombre = modem.getNombreADSL();
                try
                {
                    int numeroUsuario = Integer.parseInt(nombre.substring(5,nombre.length()));

                    if(contador == numeroUsuario)
                    {
                        existe = true;
                        break;
                    }
                }
                catch(Exception e)
                {
                    //out.print(e.toString());
                }
            }
            if(!existe)
            {
                break;
            }
            else
            {
                contador++;
            }
        }



        if(contador < 10)
        {
            respuesta = "00" + contador;
        }
        else if(contador < 100)
        {
            respuesta = "0" + contador;
        }
        else
        {
            respuesta =  "" + contador;
        }
       return respuesta;
   }
   public static String ipSugerida()
   {
       String respuesta = "";
       
       int contador = 1;
       
       java.util.ArrayList<model.Modem> arr = daos.ModemsDAO.findAll();
       
       while(true)
       {
           boolean existe = false;
           
           //System.out.println("contador :" + contador);
           for(Modem modem : arr)
           {
               String[] v = modem.getDireccionIP().split(Pattern.quote("."));
               
                if(v.length > 3 && !existe)
                {
                   try
                   {
                        int tercerTupla = Integer.parseInt(v[3]);
                        //System.out.println(modem.getDireccionIP() + "|" + tercerTupla);
                        
                        if(tercerTupla == contador)
                        {
                            existe = true;
                            break;
                        }
                   }
                   catch(Exception e)
                   {
                       e.printStackTrace();
                   }
                }
                
           }
           if(!existe)
           {
               break;
           }else
           {
               contador++;
           }
       }
        
       respuesta = "" + contador;
       
       return respuesta;
   } 
}
