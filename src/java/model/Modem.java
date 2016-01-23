package model;

import com.google.gson.Gson;

public class Modem
{
    private String nombreADSL;
    private final String password = "1nTr4l0t";
    private String direccionIP;
    private int reintentos;
    private final String mascaraDeSubRed = "255.255.255.0";
    private String observaciones;
    
    private Radreply radreplyIP;
    private Radreply radreplyNetMask;
    private Radcheck radcheckObservaciones;
    
    public Modem()
    {
        this.nombreADSL = "";
        this.direccionIP = "";
        this.reintentos = 0;
        this.observaciones = "";
        
        radreplyIP = new Radreply();
        radreplyNetMask = new Radreply();
        radcheckObservaciones = new Radcheck();
    }
    public Modem(String nombreADSL,String direccionIP, int reintentos , String observaciones)
    {
        this.nombreADSL = nombreADSL;
        this.direccionIP = direccionIP;
        this.reintentos = reintentos;
        this.observaciones = observaciones;
        
        radreplyIP = new  Radreply(nombreADSL, "Framed-IP-Address", "=", direccionIP);
        radreplyNetMask = new  Radreply(nombreADSL, "Framed-IP-Netmask", "=", mascaraDeSubRed);
        radcheckObservaciones = new Radcheck(nombreADSL, "User-Password", "==", password, reintentos, observaciones);
    }
    
    //<editor-fold desc="GYS">
    public String getNombreADSL()
    {
        return nombreADSL;
    }

    public void setNombreADSL(String nombreADSL)
    {
        this.nombreADSL = nombreADSL;
        radreplyIP.setUsername(nombreADSL);
        radreplyNetMask.setUsername(nombreADSL);
        radcheckObservaciones.setUsername(nombreADSL);
    }

    public String getDireccionIP()
    {
        return direccionIP;
    }

    public void setDireccionIP(String direccionIP)
    {
        this.direccionIP = direccionIP;
        radreplyIP.setAttribute("Framed-IP-Address");
        radreplyIP.setOp("=");
        radreplyIP.setValue(direccionIP);
        
        radreplyNetMask.setAttribute("Framed-IP-Netmask");
        radreplyNetMask.setOp("=");
        radreplyNetMask.setValue("255.255.255.0");
    }

    public int getReintentos()
    {
        return reintentos;
    }

    public void setReintentos(int reintentos)
    {
        this.reintentos = reintentos;
        this.radcheckObservaciones.setReint(reintentos);
    }

    public String getObservaciones()
    {
        return observaciones;
    }

    public void setObservaciones(String observaciones)
    {
        this.observaciones = observaciones;
        radcheckObservaciones.setAttribute("User-password");
        radcheckObservaciones.setOp("==");
        radcheckObservaciones.setValue("1nTr4l0t");
        radcheckObservaciones.setObservaciones(observaciones);
    }

    public Radreply getRadreplyIP()
    {
        return radreplyIP;
    }

    public void setRadreplyIP(Radreply radreplyIP)
    {
        this.radreplyIP = radreplyIP;
        this.direccionIP = radreplyIP.getValue();
    }

    public Radreply getRadreplyNetMask()
    {
        return radreplyNetMask;
    }

    public void setRadreplyNetMask(Radreply radreplyNetMask)
    {
        this.radreplyNetMask = radreplyNetMask;
    }

    public Radcheck getRadcheckObservaciones()
    {
        return radcheckObservaciones;
    }

    public void setRadcheckObservaciones(Radcheck radcheckContraseñaYObservaciones)
    {
        this.radcheckObservaciones = radcheckContraseñaYObservaciones;
        this.nombreADSL = radcheckObservaciones.getUsername();
        this.observaciones = radcheckObservaciones.getObservaciones();
        this.reintentos = radcheckObservaciones.getReint();
    }
    public String getPassword()
    {
        return password;
    }

    public String getMascaraDeSubRed()
    {
        return mascaraDeSubRed;
    }
    //</editor-fold>

    

    @Override
    public String toString()
    {
        return "Modem{" + "nombreADSL=" + nombreADSL + ", password=" + password + ", direccionIP=" + direccionIP + ", reintentos=" + reintentos + ", mascaraDeSubRed=" + mascaraDeSubRed + ", observaciones=" + observaciones + 
                "\n| radreplyIP=" + radreplyIP.toString() +
                "\n| radreplyNetMask=" + radreplyNetMask.toString() +
                "\n| radcheckObservaciones=" + radcheckObservaciones.toString() + '}';
    }
    public String toJSON()
    {
        Gson gson = new Gson();
        
        return gson.toJson(this);
    }
}
