/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.climateRecord;
import com.icip.core.ENUMS.VarTypeEnum;
import com.icip.core.model.PointModel;
import com.icip.core.service.ClimateRecordService;
import com.icip.utils.ScenarioAndResolutionUtil;
import com.icip.utils.ScenarioEnumChecker;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StopWatch;
/**
 *
 * @author icipmac
 */
public class ClimateRecordHandler {
    
    
  //  @Autowired
    //private ClimateRecordService climateRecordService; 
    
    //ClimateRecord icipUser
    public static ClimateRecord  FindClimateRecord(long id)
    {
       // EntityManagerFactory emf = Persistence.createEntityManagerFactory("climatepostgre");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
        EntityManager em = emf.createEntityManager();

        try
        {
            Query query = em.createQuery("select r from ClimateRecord r where r.cdID = :id");
            query.setParameter("id", id);
            ClimateRecord user=(ClimateRecord)query.getSingleResult();
            return user;
            
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

 
    

    
    public  PointModel FindClimateRecordsFuturePastCLM(
            String mainScanerio,
            String drivingdata, 
            String modelClm, 
            String varR, 
            String season, 
            String start_future1, 
            String start_future2, 
            String start_past1, 
            String start_past2, 
            String end_future1, 
            String end_future2, 
            String end_past1, 
            String end_past2, List<ClimateRecord> records ) 
    {
        
          if(records != null){
              
               ScenarioAndResolutionUtil ut = new ScenarioAndResolutionUtil(modelClm, drivingdata, mainScanerio);
            ut.CreateListOfPossibleScenariosAndResolution();
            
            List<String> scenarios;
            scenarios = ut.getScenarios();
                    //Arrays.asList(scenarioP, "C20");
            
            int startFuture1 = Integer.parseInt(start_future1);
            int startFuture2 = Integer.parseInt(start_future2);
            
           
            
            int startPast1 = Integer.parseInt(start_past1);
                    
            int startPast2 = Integer.parseInt(start_past2);
            
            VarTypeEnum e = VarTypeEnum.valueOf(varR);
              
              
            PointModel m = new PointModel();
            m.setCalculationType(ScenarioEnumChecker.CheckVar(e));
            m.setScenarios(scenarios);
            m.setRecords(records);
            m.setMainScenario(mainScanerio);
            
            m.CalculateAverages(startPast1, startPast2, startFuture1, startFuture2);
          //  m.CalculateChartResults();
            
            //int i = 1;
            
            return m;
          }
    
        return null; 
    }

   
    public PointModel FindClimateRecordsHighMediumLow(
            String simpleScenario,
            String simpleYear, 
            String varR, 
            String season,
            List<ClimateRecord> rec
           )
    {
//        EntityManagerFactory emf = Persistence.createEntityManagerFactory("icippostgre");
//      // EntityManagerFactory emf = Persistence.createEntityManagerFactory("climatepostgre");
//        EntityManager em = emf.createEntityManager();
//        try
//        {
//            Query query = em.createQuery("select r from ClimateRecord r where "
//                    + "r.modelNameR IN (:modelClms) "
//                    + "and r.modelNameG IN (:drivingData) "
//                    + "and r.scenario IN (:scenarioP) "
//                    + "and r.resolution= :resolution "
//                    + "and r.variable_name = :varP "
//                    + "and r.months = :season_str "
//                    + "and r.start_yr IN (:start_yr) "
//                    + "and r.end_yr IN (:end_yr) ");
//          if()
        
        if(rec != null){
            int simpleSc = Integer.parseInt(simpleScenario);
            
            ScenarioAndResolutionUtil ut = new ScenarioAndResolutionUtil();
            
            List<String> drivingdata; // hadgemES-5
            drivingdata = ut.getDrivingDataForLowMedimHigh(simpleSc);
            
            List<String> scenarios; // A1B, C20
            scenarios = ut.getScenariosForLowMedimHigh(simpleSc);
            
            int sty = Integer.parseInt(simpleYear);
                    //2041;
                    //Integer.parseInt(simpleYear);
            
            
            // if 2021 base period 
            // would be 1961 - 1980
            //if 2041 base period 
            // would be 1981 - 2000
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
            
//            List<String> modelClmsList = ut.getCLMSForLowMedimHigh();
//            
//            query.setParameter("resolution", "7km"); // change it to 7km was 4km
//            query.setParameter("modelClms", modelClmsList);  
//            query.setParameter("drivingData", drivingdata); // have to be string array
//            query.setParameter("varP", varR);
//            query.setParameter("season_str", season);
//            query.setParameter("scenarioP", scenarios);
//            query.setParameter("start_yr", startYears);
//            query.setParameter("end_yr", endYears);
            
            VarTypeEnum e = VarTypeEnum.valueOf(varR);
            
            
//            List<ClimateRecord> records=query.getResultList();
            
            PointModel m = new PointModel();
            m.setCalculationType(ScenarioEnumChecker.CheckVar(e));
            m.setScenarios(scenarios);
            m.setRecords(rec);
            m.createResultForLowMwdiumHigh(simpleSc, syp1, (syp1+10),sty,(sty+10));
         //   m.CalculateChartResults();
            
            return m;
           
        }
            
//        }
//        catch (Exception e)
//        {
//            //e.printStackTrace();
//        }
//        finally
//        {
//            em.close();
//            emf.close();
//        }
    
        return null;
    }
    
    
}
