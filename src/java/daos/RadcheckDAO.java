package daos;

import model.Radcheck;

public class RadcheckDAO
{
    public static java.util.ArrayList<model.Radcheck> findAll()
    {
        java.util.ArrayList<model.Radcheck>  arr = new java.util.ArrayList<model.Radcheck> ();
        
        String hql = "SELECT r FROM Radcheck r";
        
        for(Object o : daos.DAOEclipse.findAllByJPQL(hql))
        {
            arr.add((model.Radcheck) o);
        }
        
        return arr;
        
    }

    public static boolean save(Radcheck radcheck)
    {
        return daos.DAOEclipse.save(radcheck);
    }
}
