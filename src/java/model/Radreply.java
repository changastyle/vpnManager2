package model;

import javax.persistence.*;

@Entity @Table(name = "radreply")
public class Radreply
{
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String username;
    private String attribute;
    private String op;
    private String value;

    public Radreply()
    {
        this.username = "";
        this.attribute = "";
        this.op = "";
        this.value = "";
    }
    public Radreply(String username, String attribute, String op, String value)
    {
        this.username = username;
        this.attribute = attribute;
        this.op = op;
        this.value = value;
    }
    
    //<editor-fold desc="GYS">
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
     //</editor-fold>

    @Override
    public String toString()
    {
        return "Radreply{" + "id=" + id + ", username=" + username + ", attribute=" + attribute + ", op=" + op + ", value=" + value + '}';
    }
}
