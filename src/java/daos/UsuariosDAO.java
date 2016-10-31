package daos;

import java.util.ArrayList;
import java.util.List;
import model.Radcheck;
import model.Radreply;
import model.Usuario;

public class UsuariosDAO
{
    public static List<Usuario> findAll()
    {
        List<Usuario> arrUsuarios = new ArrayList<Usuario>();
        List<Radcheck> arrRadChecks  = RadcheckDAO.findAll();
        List<Radreply> arrRadreplys  = RadreplyDAO.findAll();
       
        for(Radcheck radcheck : arrRadChecks)
        {
            if (!radcheck.getUsername().startsWith("adsl_"))
            {
                
                if(radcheck.getAttribute().equalsIgnoreCase("User-password"))
                {
                     Usuario usuario = new Usuario();
                     usuario.setRadcheck(radcheck);
                     arrUsuarios.add(usuario);
                }
                else if(radcheck.getAttribute().equalsIgnoreCase("NAS-IP-Address"))
                {
                    for(int i = 0 ; i< arrUsuarios.size();i++)
                    {
                        if(arrUsuarios.get(i).getNombre().equalsIgnoreCase(radcheck.getUsername()))
                        {
                            Usuario aux = arrUsuarios.get(i);
                            aux.setRadcheck2(radcheck);
                            arrUsuarios.set(i, aux);
                        }
                    }
                }
            }
        }
        for(Radreply radreply : arrRadreplys)
        {
            if(radreply.getAttribute().equalsIgnoreCase("Service-Type"))
            {
                for(Usuario usuario : arrUsuarios)
                {
                    if (usuario.getNombre().equalsIgnoreCase(radreply.getUsername()))
                    {
                        usuario.setRadreply(radreply);
                    }
                }
            }
        }
        
        /*ArrayList<Modem> ar = new ArrayList<Modem>();
        ar.add(new Modem("test", "test", "test", 0, "test"));*/
        return arrUsuarios;
    }
    public static List<Usuario> findByName(String name)
    {
        List<Usuario> arrProvisorio = findAll();
        List<Usuario> arrRespuesta = new ArrayList<Usuario>();
        
        for (Usuario usuario :arrProvisorio)
        {
            if(usuario.getNombre() != null)
            {
                if(usuario.getNombre().toLowerCase().contains(name))
                {
                    arrRespuesta.add(usuario);
                }
            }
        }
        
        return arrRespuesta;
    }
    /*public static ArrayList<Usuario> findByObservacion(String observacion)
    {
        ArrayList<Usuario> arrProvisorio = findAll();
        ArrayList<Usuario> arrRespuesta = new ArrayList<Usuario>();
        
        for (Usuario usuario :arrProvisorio)
        {
            if(usuario.getObservaciones() != null)
            {
                if(modem.getObservaciones().toLowerCase().contains(observacion))
                {
                    arrRespuesta.add(modem);
                }
            }
        }
        
        return arrRespuesta;
    }*/
    /*public static ArrayList<Modem> findByIP(String ip)
    {
        ArrayList<Modem> arrProvisorio = findAll();
        ArrayList<Modem> arrRespuesta = new ArrayList<Modem>();
        
        for (Modem modem :arrProvisorio)
        {
            if(modem.getDireccionIP() != null)
            {
                if(modem.getDireccionIP().toLowerCase().contains(ip))
                {
                    arrRespuesta.add(modem);
                }
            }
        }
        
        return arrRespuesta;
    }*/
    public static boolean save(Usuario usuario)
    {
        boolean ok = false;
        System.out.println("usuario TO SAVE: " + usuario.toString() );
        boolean insertoRadCheck = daos.RadcheckDAO.save(usuario.getRadcheck());
        boolean insertoRadCheck2 = daos.RadcheckDAO.save(usuario.getRadcheck2());
        boolean insertoRadReply = daos.RadreplyDAO.save(usuario.getRadreply());
      
        if(insertoRadCheck && insertoRadCheck2  && insertoRadReply)
        {
            ok = true;
        }
        return ok;
    }
    public static boolean delete(String name)
    {
        boolean respuesta = false;
        boolean respuesta1 = false;
        boolean respuesta2 = false;
        boolean respuesta3 = false;
        
         List<Usuario> arr = findByName(name);
         
         if(arr.size() > 0)
         {
             respuesta1 = daos.AbstractDAO.deleteOne(arr.get(0).getRadcheck());
             respuesta2 = daos.AbstractDAO.deleteOne(arr.get(0).getRadcheck2());
             respuesta2 = daos.AbstractDAO.deleteOne(arr.get(0).getRadreply());
             
             if(respuesta1 && respuesta2 && respuesta3 )
             {
                respuesta = true; 
             }
         }
         return respuesta;
    }
    /*public static boolean update(String name , String nuevoValor)
    {
        boolean respuesta = false;
        ArrayList<Usuario> arr = findByName(name);
         
        if(arr.size() > 0)
        {
            arr.get(0).getRadcheckObservaciones().setObservaciones(nuevoValor);
            respuesta = model.daos.AbstractDAO.update(arr.get(0).getRadcheckObservaciones());
        }
        
         return respuesta;
    }*/
}