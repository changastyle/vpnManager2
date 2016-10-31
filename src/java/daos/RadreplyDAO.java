package daos;

import model.Radreply;

public class RadreplyDAO
{
    public static java.util.ArrayList<model.Radreply> findAll()
    {
        java.util.ArrayList<model.Radreply>  arr = new java.util.ArrayList<model.Radreply> ();
        
        String hql = "SELECT r FROM Radreply r";
        
        for(Object o : daos.DAOEclipse.findAllByJPQL(hql))
        {
            arr.add((model.Radreply) o);
        }
        
        return arr;
        
    }

    public static boolean save(Radreply radreply)
    {
        return daos.DAOEclipse.save(radreply);
    }
}
