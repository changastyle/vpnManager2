package daos;

import java.util.ArrayList;
import model.Modem;
import model.Radcheck;
import model.Radreply;

public class ModemsDAO
{
    public static ArrayList<Modem> findAll()
    {
        ArrayList<Modem> arrModems = new ArrayList<Modem>();
        ArrayList<Radcheck> arrRadChecks = RadcheckDAO.findAll();
        ArrayList<Radreply> arrRadreplys = RadreplyDAO.findAll();
       
        for(Radcheck radcheck : arrRadChecks)
        {
            if (radcheck.getUsername().startsWith("adsl_"))
            {
                Modem modem = new Modem();
                modem.setRadcheckObservaciones(radcheck);
                arrModems.add(modem);
            }
        }
        for(Radreply radreply : arrRadreplys)
        {
            if(radreply.getAttribute().equalsIgnoreCase("Framed-IP-Address"))
            {
                for(Modem modem : arrModems)
                {
                    if (modem.getNombreADSL().equalsIgnoreCase(radreply.getUsername()))
                    {
                        modem.setRadreplyIP(radreply);
                    }
                }
            }
            else if(radreply.getAttribute().equalsIgnoreCase("Framed-IP-Netmask"))
            {
                for(Modem modem : arrModems)
                {
                    if (modem.getNombreADSL().equalsIgnoreCase(radreply.getUsername()))
                    {
                        modem.setRadreplyNetMask(radreply);
                    }
                }
            }
        }
        
        /*ArrayList<Modem> ar = new ArrayList<Modem>();
        ar.add(new Modem("test", "test", "test", 0, "test"));*/
        return arrModems;
    }
    public static boolean existeIP(String ip)
    {
        boolean existe = false;
        
        for(Modem modem : findAll())
        {
            if(modem.getDireccionIP().equalsIgnoreCase(ip))
            {
                existe = true;
            }
        }
        return existe;
    }
    public static ArrayList<Modem> findByName(String name)
    {
        ArrayList<Modem> arrProvisorio = findAll();
        ArrayList<Modem> arrRespuesta = new ArrayList<Modem>();
        
        for (Modem modem :arrProvisorio)
        {
            if(modem.getNombreADSL() != null)
            {
                if(modem.getNombreADSL().toLowerCase().contains(name))
                {
                    arrRespuesta.add(modem);
                }
            }
        }
        
        return arrRespuesta;
    }
    public static ArrayList<Modem> findByObservacion(String observacion)
    {
        ArrayList<Modem> arrProvisorio = findAll();
        ArrayList<Modem> arrRespuesta = new ArrayList<Modem>();
        
        for (Modem modem :arrProvisorio)
        {
            if(modem.getObservaciones() != null)
            {
                if(modem.getObservaciones().toLowerCase().contains(observacion))
                {
                    arrRespuesta.add(modem);
                }
            }
        }
        
        return arrRespuesta;
    }
    public static ArrayList<Modem> findByIP(String ip)
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
    }
    public static boolean save(Modem modem)
    {
        boolean ok = false;
        
        System.out.println("MODEM TO SAVE: " + modem.toString() );
        
        if(modem.getNombreADSL().toLowerCase().startsWith("adsl_"))
        {
            boolean yaExiste = false;
        
            for(Modem aux : findAll())
            {
                if(aux.getNombreADSL().equalsIgnoreCase(modem.getNombreADSL()))
                {
                    yaExiste = true;
                }
            }
            if(!yaExiste)
            {
                boolean insertoObservaciones = daos.RadcheckDAO.save(modem.getRadcheckObservaciones());
                boolean insertoRadReplyIP = daos.RadreplyDAO.save(modem.getRadreplyIP());
                boolean insertoRadReplyNetMask = daos.RadreplyDAO.save(modem.getRadreplyNetMask());

                if(insertoObservaciones && insertoRadReplyIP  && insertoRadReplyNetMask )
                {
                    ok = true;
                }
            }
        }

        return ok;
    }
    
    
    public static boolean delete(Modem modem)
    {
        boolean borro1 = false;
        boolean borro2 = false;
        boolean borro3 = false;
        
        if(modem.getDireccionIP() != null)
        {
            borro1 = DAOEclipse.remove(modem.getRadreplyIP());
        }
        if(modem.getRadreplyNetMask() != null)
        {
            borro2 = DAOEclipse.remove(modem.getRadreplyNetMask());
        }
        if(modem.getDireccionIP() != null)
        {
            borro3 = DAOEclipse.remove(modem.getRadcheckObservaciones());
        }
        return  borro1 && borro2 && borro3;
    }
    public static boolean update(Modem modem)
    {
        boolean ok1 = daos.DAOEclipse.update(modem.getRadreplyIP());
        boolean ok2 = daos.DAOEclipse.update(modem.getRadreplyNetMask());
        boolean ok3 = daos.DAOEclipse.update(modem.getRadcheckObservaciones());
        
        if(ok1 && ok2 && ok3)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static boolean update2(Modem modem)
    {
       /* arrObjetosActualizados.add(modem.getRadreplyIP());
        arrObjetosActualizados.add(modem.getRadreplyNetMask());
        arrObjetosActualizados.add(modem.getRadcheckObservaciones());*/
        
        boolean actualizo1 = false;
        boolean actualizo2 = false;
        boolean actualizo3 = false;
        
        if(modem.getRadreplyIP() != null)
        {
            actualizo1 = daos.DAOEclipse.update(modem.getRadreplyIP());
        }
        if(modem.getRadreplyNetMask() != null)
        {
            actualizo2 = daos.DAOEclipse.update(modem.getRadreplyNetMask());
        }
        if(modem.getRadcheckObservaciones() != null)
        {
            actualizo3 = daos.DAOEclipse.update(modem.getRadcheckObservaciones());
        }
        
        //PASSWORD, IP, DESCRIPCIOn
        return actualizo1 && actualizo2 && actualizo3;
    }
}
