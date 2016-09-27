/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.climateRecord.ClimateRecord;
import com.icip.core.icipresult.ICIPScenarioResult;
import com.icip.core.repository.ClimateRecordRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Service("climateRecordService")
public class ClimateRecordServiceImpl implements ClimateRecordService{

    @Autowired
    private ClimateRecordRepository climateRecordRepository;
    
    
    @Transactional
    public ClimateRecord findRecordById(Long id) {
        return this.climateRecordRepository.findRecordById(id);
    }

    @Override
    //@Transactional
    public List<ClimateRecord> findClimateRecordsFutureAndPastClm(String mainScanerio, String drivingdata, String modelClm, String varR, String season, String start_future1, String start_future2, String start_past1, String start_past2, String end_future1, String end_future2, String end_past1, String end_past2) {
               
        List<ClimateRecord> res =  climateRecordRepository.findClimateRecordsFutureAndPastClm(mainScanerio, drivingdata, modelClm, varR, season, start_future1, start_future2, start_past1, start_past2, end_future1, end_future2, end_past1, end_past2);
//        ClimateRecordHandler ch = new ClimateRecordHandler();
//        PointModel model = ch.FindClimateRecordsFuturePastCLM(mainScanerio,drivingdata,modelClm,
//                varR,season,start_future1,start_future2,start_past1,start_past2,end_future1,end_future2,
//                end_past1,end_past2, res);
        
        return res;
    
    }

    @Override
    public List<ClimateRecord> findPointModellowMediumHigh(String simpleScenario, String simpleYear, String varR, String season) {
        List<ClimateRecord> res = this.climateRecordRepository.findRecordslowMediumHigh(simpleScenario, simpleYear, varR, season);
        //ClimateRecordHandler ch = new ClimateRecordHandler();
        
       // PointModel model = ch.FindClimateRecordsHighMediumLow(simpleScenario, simpleYear, varR, season, res);
        return res;   
    }

    @Override
    public List<ICIPScenarioResult> findAllScenarioResults() {
        return this.climateRecordRepository.findAllScenarioResults();
    }
    
}
