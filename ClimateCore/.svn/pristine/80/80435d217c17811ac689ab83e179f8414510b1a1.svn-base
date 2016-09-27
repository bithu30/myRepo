package com.icip.core.survey;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by yingwu on 19/08/2014.
 */
public class ICIPSurveyHandler
{
    public static int addICIPSurvey(ICIPSurveyGel survey)
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try
        {
            em.getTransaction().begin();
            em.persist(survey);
            em.getTransaction().commit();
            return 1;
        }
        catch (Exception e)
        {
            //e.printStackTrace();
        }
        finally
        {
            em.close();
            emf.close();
        }

        return -1;
    }





}
