package daos;

import model.Radreply;

public class RadreplyDAO
{
    public static java.util.ArrayList<model.Radreply> findAll()
    {
        java.util.ArrayList<model.Radreply>  arr = new java.util.ArrayList<model.Radreply> ();
        
        String hql = "from Radreply";
        
        for(Object o : daos.AbstractDAO.findAll(hql))
        {
            arr.add((model.Radreply) o);
        }
        
        return arr;
        
    }

    public static boolean save(Radreply radreply)
    {
        return daos.AbstractDAO.saveOneNew(radreply);
    }
}
