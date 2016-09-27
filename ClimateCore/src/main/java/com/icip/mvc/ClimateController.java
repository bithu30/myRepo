/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.mvc;

import com.icip.core.model.PointModel;
import com.icip.core.climateRecord.ClimateRecord;
import com.icip.core.climateRecord.ClimateRecordHandler;
import com.icip.core.icipresult.ICIPScenarioResult;
import com.icip.core.model.ScenarioResultModel;
import com.icip.core.service.ClimateRecordService;
import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author icipmac
 */
@RestController
@RequestMapping("/climate")
public class ClimateController {

    @Autowired
    private ClimateRecordService climateRecordService; 
    
    //@ResponseBody
    
    // testin route
   @RequestMapping(value="/getRecord", method = RequestMethod.GET) 
   public ClimateRecord findRecordById(HttpServletRequest request, HttpServletResponse response)
   {
       
       ClimateRecord r = this.climateRecordService.findRecordById(5475101L);
       
       return r;
   }
    
    
    @RequestMapping(value="getrecordsclm", method = RequestMethod.GET)
    public ResponseEntity<?> getRecordsClm(HttpServletRequest request, HttpServletResponse response)
            //, SessionStatus status)
    { 
    
       String drivingdata = request.getParameter("drivingdata");
       String safedrivingdata = Jsoup.clean(drivingdata, Whitelist.basic());
       
       String varR = request.getParameter("varR");
       String safevarR = Jsoup.clean(varR, Whitelist.basic());
       
       String season = request.getParameter("seasonclm");
       String safeseason = Jsoup.clean(season, Whitelist.basic());
       
       String modelClm = request.getParameter("modelclm");
       String safemodelClm = Jsoup.clean(modelClm, Whitelist.basic());
       
       String mainScenario = request.getParameter("mainscenario");
       String safemainScenario = Jsoup.clean(mainScenario, Whitelist.basic());
       
       String start_future1 = request.getParameter("start_yr_future1");
       String safestart_future1 = Jsoup.clean(start_future1, Whitelist.basic());
       
       String start_future2 = request.getParameter("start_yr_future2");
       String safestart_future2 = Jsoup.clean(start_future2, Whitelist.basic());
       
       String   start_past1 = request.getParameter("start_yr_past1");
       String safestart_past1 = Jsoup.clean(start_past1, Whitelist.basic());
       
       String   start_past2 = request.getParameter("start_yr_past2") ;
       String safestart_past2 = Jsoup.clean(start_past2, Whitelist.basic());
       
       String   end_future1 = request.getParameter("end_yr_Rest1");
       String safeend_future1 = Jsoup.clean(end_future1, Whitelist.basic());
       
       String   end_future2 = request.getParameter("end_yr_Rest2");
       String safeend_future2 = Jsoup.clean(end_future2, Whitelist.basic());
       
       String   end_past1 = request.getParameter("end_yr_past1");
       String safeend_past1 = Jsoup.clean(end_past1, Whitelist.basic());
       
       String   end_past2 = request.getParameter("end_yr_past2");
       String safeend_past2 = Jsoup.clean(end_past2, Whitelist.basic());
       
        
       
       List<ClimateRecord> res =  climateRecordService.findClimateRecordsFutureAndPastClm(
               safemainScenario,
                safedrivingdata,
                safemodelClm,
                safevarR, 
                safeseason,
                safestart_future1,
                safestart_future2,
                safestart_past1,
                safestart_past2,
                safeend_future1,
                safeend_future2,
                safeend_past1,
                safeend_past2);
       PointModel model =null;
       if(res.size() > 0){
               ClimateRecordHandler ch = new ClimateRecordHandler();
                model = ch.FindClimateRecordsFuturePastCLM(safemainScenario,drivingdata,modelClm,
                varR,season,start_future1,start_future2,start_past1,start_past2,end_future1,end_future2,
                end_past1,end_past2, res);
       }
       if(model != null)
        {
          // status.setComplete();
           return new ResponseEntity<PointModel>(model,HttpStatus.OK);
        }
         
        return new ResponseEntity<String>("Nothing was found for selected values", HttpStatus.BAD_REQUEST);
    }
    
    
    @RequestMapping(value="getrecordslowmediumhigh", method = RequestMethod.GET)
    public ResponseEntity<?> getRecordslowMediumHigh(HttpServletRequest request, HttpServletResponse response)
            //SessionStatus status)
    {
        String simpleScenario = request.getParameter("simpleScenario");
        String safesimpleScenario = Jsoup.clean(simpleScenario, Whitelist.basic());
        
        String varR = request.getParameter("varR");
        String safevarR = Jsoup.clean(varR, Whitelist.basic());
        
        String season = request.getParameter("season");
        String safeseason = Jsoup.clean(season, Whitelist.basic());
        
        String year = request.getParameter("yearSimple");
        String safeyear = Jsoup.clean(year, Whitelist.basic());
        

       // PointModel model = ClimateRecordHandler.FindClimateRecordsHighMediumLow(safesimpleScenario, safeyear, safevarR, safeseason);
        
        List<ClimateRecord> res = climateRecordService.findPointModellowMediumHigh(simpleScenario, safeyear, varR, season);
        ClimateRecordHandler ch = new ClimateRecordHandler();
        
        PointModel model = null;
        
        if(res.size() > 0){
         model = ch.FindClimateRecordsHighMediumLow(simpleScenario, safeyear, varR, season, res);
        }
        
       if(model != null)
        {
          // status.setComplete();
           return new ResponseEntity<PointModel>(model,HttpStatus.OK);
        }
         
        return new ResponseEntity<String>("Nothing was found for selected values", HttpStatus.BAD_REQUEST);
    }
    
    @RequestMapping(value="getAllScenarioResults", method = RequestMethod.GET)
    public ResponseEntity<?> getScenarioResults(HttpServletRequest request, HttpServletResponse response)
            //, SessionStatus status)
    {
       
        
        List<ICIPScenarioResult> res = this.climateRecordService.findAllScenarioResults();
        
        //ScenarioResultModel model = ICIPScenarioResultHandler.FindAllResults();
        ScenarioResultModel model = new ScenarioResultModel();
        model.setScenarioResults(res);
        
       if(model != null)
        {
          // status.setComplete();
           return new ResponseEntity<ScenarioResultModel>(model,HttpStatus.OK);
        }
         
        return new ResponseEntity<String>("Nothing was found for selected values", HttpStatus.BAD_REQUEST);
    }
    
    
}
