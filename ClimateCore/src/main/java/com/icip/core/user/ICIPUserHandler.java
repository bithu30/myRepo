package com.icip.core.user;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 * Created by yingwu on 15/05/2014.
 */
public class ICIPUserHandler {

    public static int addICIPUser(ICIPUser icipUser) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(icipUser);
            em.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }

        return -1;
    }

    public static boolean deleteUser(ICIPUser icipUser) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try {
            Query query = em.createQuery("delete from ICIPUser u where u.email = :email");
            query.setParameter("email", icipUser.getEmail());
//            ICIPUser user = (ICIPUser) query.getSingleResult();
            return true;
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }

        return false;
    }

    public static ICIPUser searchICIPUser(String username) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try {
            Query query = em.createQuery("select u from ICIPUser u where u.email = :email");
            query.setParameter("email", username);
            ICIPUser user = (ICIPUser) query.getSingleResult();
            return user;
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }

        return null;
    }

}
