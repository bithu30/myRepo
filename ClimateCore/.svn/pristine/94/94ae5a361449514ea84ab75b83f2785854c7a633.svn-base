/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.utils;

import static ch.lambdaj.Lambda.having;
import static ch.lambdaj.Lambda.on;
import static ch.lambdaj.Lambda.select;
import com.icip.core.DTOS.ResultDto;
import com.icip.core.climateRecord.ClimateRecord;
import java.util.List;
import org.hamcrest.Matchers;

/**
 *
 * @author icipmac
 */
public class ResultDtoUtil {
    
    public static ResultDto GetResultDtoWthGivenScenarioAndModel(
            List<ClimateRecord> RecordsP, 
            String ScenarioP, 
            String ModelP,
            int start_yr1,
            int start_yr2)
    {
        ResultDto rdto = new ResultDto();
        
        List<ClimateRecord> filteredRecord = (select(RecordsP, having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(ScenarioP))
                .and(having(on(ClimateRecord.class).getModelNameG(), Matchers.equalToIgnoringCase(ModelP)))));
              
        rdto.setListFirstYears(select(filteredRecord, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(start_yr1))));
 
        rdto.setListSecondYears(select(filteredRecord, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(start_yr2))));
         
        return rdto;
    }
    
    
    public static ResultDto GetResultDtoWthGivenScenarioAndModelAndClm(
            List<ClimateRecord> RecordsP, 
            String ScenarioP, 
            String ModelP,
            int start_yr1,
            int start_yr2,
            String CmlP)
    {
        ResultDto rdto = new ResultDto();
        
        List<ClimateRecord> filteredRecord = 
                (select
        (RecordsP, 
                having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(ScenarioP))
                .and(having(on(ClimateRecord.class).getModelNameG(), Matchers.equalToIgnoringCase(ModelP)))
                .and(having(on(ClimateRecord.class).getModelNameR(), Matchers.equalToIgnoringCase(CmlP)))
        ));
        
        rdto.setListFirstYears(select(filteredRecord, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(start_yr1))));
 
        rdto.setListSecondYears(select(filteredRecord, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(start_yr2))));
        
        return rdto;      
    }
    
}
