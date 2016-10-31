package daos;

import java.util.ArrayList;
import model.Radcheck;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class AbstractDAO 
{

    private static SessionFactory sessionFactory = hibernate.HibernateUtil.getSessionFactory();
    private static Session session;
    
    public static void conectar() 
    {           
        try 
        {
            if(session != null)
            {
                if(session.isConnected())
                {
                    desconectar();
                }
                else
                {
                   session = sessionFactory.openSession();     System.out.println("AbstractDAO.conectar() -> ABRO session: " + session); 
                }
            }
            else
            {
                session = sessionFactory.openSession();     System.out.println("AbstractDAO.conectar() -> ABRO session: " + session);
            } 
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            System.out.println("ERROR: AbstractDAO -> conectar(): " + e);
        }
    }

    public static boolean desconectar() 
    {
        boolean respuesta = false;
        try 
        {
            if (session != null )
            {
                if(session.isOpen())
                {
                    session.close();    System.out.println("AbstractDAO.desconectar("+  session + ")");
                }
                
            }
        } 
        catch (Exception e) 
        {
            //e.printStackTrace();
            //System.out.println("ERROR: AbstractDAO -> desconectar()" + e);
        }
        return respuesta;
    }

    public static boolean saveOneNew(Object object) 
    {
        boolean ok = false;

        Transaction transaction = null;
        conectar();
        
        try 
        {
            transaction = session.beginTransaction();         System.out.println("AbstractDAO.saveOneNew("+  object + ") -> beginTransaction");
            session.save(object);
            transaction.commit();                                       System.out.println("AbstractDAO.saveOneNew("+  object + ") -> commit");

            ok = true;
        }
        catch (Exception e) 
        {
            transaction.rollback();                                     System.out.println("AbstractDAO.saveOneNew("+  object + ") -> rollback");
            e.printStackTrace();
            System.out.println("ERROR: ABSTRACTDAO.saveOneNew(" + object +")");
        }

        desconectar();
        return ok;
    }

    public static boolean saveAllNew(ArrayList<Object> arr) 
    {
        boolean todoOK = true;
        Transaction transaction = null;

        //Session sessionProvisoria = conectar();
        conectar();
        
        try 
        {
            transaction = session.beginTransaction(); System.out.println("AbstractDAO.saveAllNew("+  arr + ") -> beginTransaction");
            
            for (Object object : arr) 
            {
                session.save(object);
            }
            
            transaction.commit();               System.out.println("AbstractDAO.saveAllNew("+  arr + ") -> commit");
        }
        catch (Exception e) 
        {
            transaction.rollback();             System.out.println("AbstractDAO.saveAllNew("+  arr + ") -> rollback");
            e.printStackTrace();
            todoOK = false;
            System.out.println("ERROR: ABSTRACTDAO.saveAllNew(" + arr + "): " + e);
        }

        desconectar();

        return todoOK;
    }

    public static ArrayList<Object> findAll(Class clase) 
    {
        ArrayList<Object> arrRespuesta = null;
        
        try 
        {
            arrRespuesta = new ArrayList<Object>();
            
            conectar();
            

            Criteria cr = session.createCriteria(clase);       System.out.println("AbstractDAO.findAll("+  clase + ") -> hql: " + clase);
            arrRespuesta = (ArrayList<Object>) cr.list();
        } 
        catch (Exception e) 
        {
            //Me re hinchaba las pelotas:
            e.printStackTrace();
            System.out.println("ERROR: ABSTRACTDAO.findAll(" + clase.getName() + ")");
        }

        desconectar();

        return arrRespuesta;
    }

    public static ArrayList<Object> findAll(String hql)
    {
        ArrayList<Object> arrRespuesta = new ArrayList<Object>();
        conectar();

        try 
        {
            Query query = (Query) session.createQuery(hql);   
         
            arrRespuesta = (ArrayList<Object>) query.list();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
            System.out.println("ERROR: ABSTRACTDAO.findAll(" + hql +") " + e);
        }

        desconectar();

        return arrRespuesta;
    }

    public static Object get(Class clase, int id) 
    {
        Object result = null;

        conectar();

        result = session.get(clase, id);

        desconectar();

        return result;
    }

    public static boolean deleteOne(Object object) 
    {
        boolean borro = false;

        conectar();
        Transaction transaction = null;
        
        try 
        {
            transaction = session.beginTransaction();         System.out.println("AbstractDAO.deleteOne(" + object + ") -> beginTransaction");

            session.delete(object);

            transaction.commit();                                       System.out.println("AbstractDAO.deleteOne(" + object + ") -> commit");

            borro = true;
        }
        catch (Exception e) 
        {
            if (transaction != null) 
            {
                transaction.rollback();                                 System.out.println("AbstractDAO.deleteOne(" + object + ") -> rollback");
            }
            e.printStackTrace();
            System.out.println("ERROR: AbstractDAO.deleteOne(" + object +") -> "+ e);
        }

        desconectar();

        return borro;
    }
    
    public static boolean deleteMany(ArrayList<Object> arrObjetosABorrar) 
    {
        boolean borro = false;

        conectar();
        Transaction transaction = null;
        
        try 
        {
            transaction = session.beginTransaction();         System.out.println("AbstractDAO.deleteMany(" + arrObjetosABorrar + ") -> beginTransaction");

            for(Object o : arrObjetosABorrar)
            {
                session.delete(o);
            }
            
            transaction.commit();                                       System.out.println("AbstractDAO.deleteMany(" + arrObjetosABorrar + ") -> commit");

            borro = true;
        }
        catch (Exception e) 
        {
            if (transaction != null) 
            {
                transaction.rollback();                                 System.out.println("AbstractDAO.deleteMany(" + arrObjetosABorrar + ") -> rollback");
            }
            e.printStackTrace();
            System.out.println("ERROR: AbstractDAO.deleteMany(" + arrObjetosABorrar +") -> "+ e);
        }

        desconectar();

        return borro;
    }

    public static boolean updateOne(Object objetoActualizado)
    {
        boolean updateo = false;

        conectar();
        Transaction transaction = null;

        try 
        {
            transaction = session.beginTransaction();         System.out.println("AbstractDAO.updateOne(" + objetoActualizado + ") -> beginTransaction");

            session.update(objetoActualizado);

            transaction.commit();                                       System.out.println("AbstractDAO.updateOne(" + objetoActualizado + ") -> commit");

            updateo = true;
        } 
        catch (Exception e) 
        {
            if (transaction != null)
            {
                transaction.rollback();                                 System.out.println("AbstractDAO.updateOne(" + objetoActualizado + ") -> rollback");

            }
            e.printStackTrace();
            System.out.println("ERROR: AbstractDAO.updateOne(" + objetoActualizado +") : " + e);
        }

        desconectar();
        return updateo;
    }

    public static boolean updateAll(ArrayList<Object> arrObjetosActualizados) 
    {
        boolean updateo = false;

        conectar();
        Transaction transaction = null;

        try 
        {
            transaction = session.beginTransaction();         System.out.println("AbstractDAO.updateAll(" + arrObjetosActualizados + ") -> beginTransaction");

            for (Object objetoActualizado : arrObjetosActualizados) 
            {
                session.update(objetoActualizado);
            }

            transaction.commit();                                       System.out.println("AbstractDAO.updateAll(" + arrObjetosActualizados + ") -> commit");


            updateo = true;
        }
        catch (Exception e) 
        {
            if (transaction != null) 
            {
                transaction.rollback();                                 System.out.println("AbstractDAO.updateAll(" + arrObjetosActualizados + ") -> rollback");
            }
            e.printStackTrace();
            System.out.println("ERROR: AbstractDAO.updateAll(" + arrObjetosActualizados +") :" + e);
        }

        desconectar();

        return updateo;
    }

    static boolean delete(Radcheck radcheck)
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}