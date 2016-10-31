package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;

public class Usuario
{
    
    @Expose private int id;
    @Expose private String nombre;
    @Expose private String password;
    @Expose private int reintentos;
    private Radcheck radcheck;
    private Radreply radreply;
    private Radcheck radcheck2;

    public Usuario()
    {
        this.nombre = "";
        this.password = "";
        this.reintentos = 0;
        this.radcheck = new Radcheck();
        this.radreply = new Radreply();
        this.radcheck2 = new Radcheck();
    }
    public Usuario(String nombre, String password, int reintentos)
    {
        this.nombre = nombre;
        this.password = password;
        this.reintentos = reintentos;
        this.radcheck = new Radcheck(nombre, "User-password", "==", password, reintentos, "Usuario VPN de " + nombre);
        this.radcheck2 = new Radcheck(nombre, "NAS-IP-Address", "=~", "(10.10.20.5|192.168.59.84)", reintentos, "Usuario VPN de " + nombre);
        this.radreply = new Radreply(nombre, "Service-Type", "=", "Framed-User");
    }
    
    //<editor-fold desc="GYS:">

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public int getReintentos()
    {
        return reintentos;
    }

    public void setReintentos(int reintentos)
    {
        this.reintentos = reintentos;
    }

    public Radcheck getRadcheck()
    {
        return radcheck;
    }

    public void setRadcheck(Radcheck radcheck)
    {
        this.nombre = radcheck.getUsername();
        this.password =radcheck.getValue();
        this.reintentos = radcheck.getReint();
        this.radcheck = radcheck;
    }

    public Radreply getRadreply()
    {
        return radreply;
    }

    public void setRadreply(Radreply radreply)
    {
        this.radreply = radreply;
    }

    public Radcheck getRadcheck2()
    {
        return radcheck2;
    }

    public void setRadcheck2(Radcheck radcheck2)
    {
        this.radcheck2 = radcheck2;
    }
    //</editor-fold>

    @Override
    public String toString()
    {
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", password=" + password + ", reintentos=" + reintentos + '}';
    }
    
    public String toJSON()
    {
        String salida = "";
        
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        
        salida+=  gson.toJson(this);
        
        
        return salida;
    }
}
