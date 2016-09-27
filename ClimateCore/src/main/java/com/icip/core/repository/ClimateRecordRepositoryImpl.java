/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.ENUMS.VarTypeEnum;
import com.icip.core.climateRecord.ClimateRecord;
import com.icip.core.icipresult.ICIPScenarioResult;
import com.icip.utils.ScenarioAndResolutionUtil;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climateRecordRepository")
public class ClimateRecordRepositoryImpl implements ClimateRecordRepository{
    
    @PersistenceContext
    private EntityManager em;
    
    @Autowired
    private ClimateRecordJpaRepository climateRecordJpaRepository;
    
    @Autowired
    private ICIPScenarioResultJpaRepository iCIPScenarioResultJpaRepository; 

    @Override
    public ClimateRecord findRecordById(Long id) {
       // return em.find(ClimateRecord.class, id);
        
        return this.climateRecordJpaRepository.findOne(id);
    }

    @Override
    public List<ClimateRecord> findClimateRecordsFutureAndPastClm(String mainScanerio, String drivingdata, String modelClm, String varR, String season, String start_future1, String start_future2, String start_past1, String start_past2, String end_future1, String end_future2, String end_past1, String end_past2) {
        
        Query query = em.createQuery("select r from ClimateRecord r where "
                    + "r.modelNameR= :modelClm "
                    + "and r.modelNameG= :drivingData "
                    + "and r.scenario IN (:scenarioP) "
                    + "and r.resolution= :resolution "
                    + "and r.variable_name = :varP "
                    + "and r.months = :season_str "
                    + "and r.start_yr IN (:start_yr) "
                    + "and r.end_yr IN (:end_yr) ");
        
        ScenarioAndResolutionUtil ut = new ScenarioAndResolutionUtil(modelClm, drivingdata, mainScanerio);
            ut.CreateListOfPossibleScenariosAndResolution();
            
            List<String> scenarios;
            scenarios = ut.getScenarios();
                    //Arrays.asList(scenarioP, "C20");
            
            int startFuture1 = Integer.parseInt(start_future1);
            int startFuture2 = Integer.parseInt(start_future2);
            
           
            
            int startPast1 = Integer.parseInt(start_past1);
                    
            int startPast2 = Integer.parseInt(start_past2);
                  
            
            List<Integer> startYears;
             startYears = Arrays.asList(
                     startFuture1, 
                     startFuture2, 
                     startPast1,
                     startPast2);
            List<Integer> endYears;
             endYears = Arrays.asList(Integer.parseInt(end_future1),
                     Integer.parseInt(end_future2), 
                             Integer.parseInt(end_past1),
                                     Integer.parseInt(end_past2));
             
             
            query.setParameter("resolution", ut.getResolution());
            query.setParameter("modelClm", modelClm);  
            query.setParameter("drivingData", drivingdata); 
            query.setParameter("varP", varR);
            query.setParameter("season_str", season);
            query.setParameter("scenarioP", scenarios);
            query.setParameter("start_yr", startYears);
            query.setParameter("end_yr", endYears);
            
            List<ClimateRecord> result=query.getResultList();
        
            return result;
    }

    @Override
    public List<ClimateRecord> findRecordslowMediumHigh(String simpleScenario, String simpleYear, String varR, String season) {
        
        Query query = em.createQuery("select r from ClimateRecord r where "
                    + "r.modelNameR IN (:modelClms) "
                    + "and r.modelNameG IN (:drivingData) "
                    + "and r.scenario IN (:scenarioP) "
                    + "and r.resolution= :resolution "
                    + "and r.variable_name = :varP "
                    + "and r.months = :season_str "
                    + "and r.start_yr IN (:start_yr) "
                    + "and r.end_yr IN (:end_yr) ");
            
            int simpleSc = Integer.parseInt(simpleScenario);
            
            ScenarioAndResolutionUtil ut = new ScenarioAndResolutionUtil();
            
            List<String> drivingdata; // hadgemES-5
            drivingdata = ut.getDrivingDataForLowMedimHigh(simpleSc);
            
            List<String> scenarios; // A1B, C20
            scenarios = ut.getScenariosForLowMedimHigh(simpleSc);
            
            int sty = Integer.parseInt(simpleYear);
         
            int syp1 = 0;
            
            if(sty==2021){ syp1 = 1961; }
            else if(sty==2041){syp1 = 1981;}
            
            List<Integer> startYears;
            List<Integer> endYears;
            
            if(sty == 2021 || sty == 2041){
            
            startYears = Arrays.asList(
                     syp1, 
                     (syp1+10), 
                     sty,
                     (sty+10));
            
            
            endYears = Arrays.asList(
                     (syp1+9), 
                     (syp1+19), 
                     (sty+9),
                     (sty+19));
            }
            else
            { 
                // all the years beacuse 
                startYears = Arrays.asList(1961, 1971, 1981, 1991, 2021, 2031, 2041, 2051);
                endYears = Arrays.asList(1970, 1980, 1990, 2000, 2030, 2040, 2050, 2060);
            }
            
            List<String> modelClmsList = ut.getCLMSForLowMedimHigh();
            
            query.setParameter("resolution", "7km"); // change it to 7km was 4km
            query.setParameter("modelClms", modelClmsList);  
            query.setParameter("drivingData", drivingdata); // have to be string array
            query.setParameter("varP", varR);
            query.setParameter("season_str", season);
            query.setParameter("scenarioP", scenarios);
            query.setParameter("start_yr", startYears);
            query.setParameter("end_yr", endYears);
            
            VarTypeEnum e = VarTypeEnum.valueOf(varR);
            
            
            List<ClimateRecord> records=query.getResultList();
            
            return records;
    }

    @Override
    public List<ICIPScenarioResult> findAllScenarioResults() {
        return this.iCIPScenarioResultJpaRepository.findAll();
    }

    
}
