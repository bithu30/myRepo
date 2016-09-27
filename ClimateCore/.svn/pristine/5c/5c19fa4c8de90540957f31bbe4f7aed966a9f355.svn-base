/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipresult;

import com.icip.core.climateRecord.ClimateRecord;
import com.icip.core.model.ScenarioResultModel;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author icipmac
 */
public class ICIPScenarioResultHandler {
    
    public static ScenarioResultModel  FindAllResults()
    {
        //EntityManagerFactory emf = Persistence.createEntityManagerFactory("climatepostgre");       
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try
        { // return all the results 
             Query query = em.createQuery("select r from ICIPScenarioResult r");
             List<ICIPScenarioResult> results = query.getResultList();
             ScenarioResultModel m = new ScenarioResultModel();
             m.setScenarioResults(results);
             return m;
        
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

        return null;
    
    }
}
