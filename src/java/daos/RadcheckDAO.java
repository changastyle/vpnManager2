package daos;

import model.Radcheck;

public class RadcheckDAO
{
    public static java.util.ArrayList<model.Radcheck> findAll()
    {
        java.util.ArrayList<model.Radcheck>  arr = new java.util.ArrayList<model.Radcheck> ();
        
        String hql = "from Radcheck";
        
        for(Object o : daos.AbstractDAO.findAll(hql))
        {
            arr.add((model.Radcheck) o);
        }
        
        return arr;
        
    }

    public static boolean save(Radcheck radcheck)
    {
        return daos.AbstractDAO.saveOneNew(radcheck);
    }
}
