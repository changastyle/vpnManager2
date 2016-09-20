package model;

import javax.persistence.*;

@Entity @Table(name="radcheck")
public class Radcheck
{
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String username;
    private String attribute;
    private String op;
    private String value;
    private int reint;
    private String observaciones;

    public Radcheck()
    {
        this.username = "";
        this.attribute = "";
        this.op = "";
        this.value = "";
        this.reint = 0;
        this.observaciones = "";
    }
    public Radcheck(String username, String attribute, String op, String value, int reint, String observaciones)
    {
        this.username = username;
        this.attribute = attribute;
        this.op = op;
        this.value = value;
        this.reint = reint;
        this.observaciones = observaciones;
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

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getAttribute()
    {
        return attribute;
    }

    public void setAttribute(String attribute)
    {
        this.attribute = attribute;
    }

    public String getOp()
    {
        return op;
    }

    public void setOp(String op)
    {
        this.op = op;
    }

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
    {
        this.value = value;
    }

    public int getReint()
    {
        return reint;
    }

    public void setReint(int reint)
    {
        this.reint = reint;
    }

    public String getObservaciones()
    {
        return observaciones;
    }

    public void setObservaciones(String observaciones)
    {
        this.observaciones = observaciones;
    }
    
    //</editor-fold>

    @Override
    public String toString()
    {
        return "Radcheck{" + "id=" + id + ", username=" + username + ", attribute=" + attribute + ", op=" + op + ", value=" + value + ", reint=" + reint + ", observaciones=" + observaciones + '}';
    }
    
    
    
     
}
