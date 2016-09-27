/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.climateRecord.ClimateRecord;
import com.icip.core.icipresult.ICIPScenarioResult;
import com.icip.core.model.PointModel;
import java.util.List;

/**
 *
 * @author icipmac
 */
public interface ClimateRecordService {
    ClimateRecord findRecordById(Long id);
    List<ClimateRecord> findClimateRecordsFutureAndPastClm(String mainScanerio,
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
            String end_past2);
    List<ClimateRecord> findPointModellowMediumHigh(String simpleScenario,
            String simpleYear, 
            String varR, 
            String season);
    List<ICIPScenarioResult> findAllScenarioResults();
}
