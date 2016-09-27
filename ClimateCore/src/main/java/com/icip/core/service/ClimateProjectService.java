/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimateOption;
import com.icip.core.icipproject.ClimateOptionType;
import com.icip.core.icipproject.ClimatePreventiveMeasure;
import com.icip.core.model.ClimateProjectRecordsModel;
import java.util.List;

/**
 *
 * @author icipmac
 */
public interface ClimateProjectService {
    
    ClimateOptionType findClimateOptionTypeById(int id);
    ClimateOptionType createClimateOptionType(ClimateOptionType type);
    ClimateOptionType updateClimateOptionType(ClimateOptionType type);
    ClimateOption addClimateOption(int climateOptionTypeid, ClimateOption option);
    List<ClimateOptionType> findAllOptionClimateTypes();
    void deleteClimateOptionType(int id);
   
    ClimateOption findClimateOptionById(int id);
    ClimateOption updateClimateOption(ClimateOption option);
    void deleteClimateOption(int id);
    
    ClimateImpact findClimateImpactById(int id);
    ClimateImpact createClimateImpact(ClimateImpact impact);
    ClimateImpact updateClimateImpact(ClimateImpact impact);
    ClimatePreventiveMeasure addClimatePreventiveMeasure(int climateImpactid, ClimatePreventiveMeasure preventiveMeasure);
    List<ClimateImpact> findAllClimateImpacts();
    void deleteClimateImpact(int id);
    
    ClimatePreventiveMeasure findClimatePreventiveMeasureById(int id);
    ClimatePreventiveMeasure updateClimatePreventiveMeasure(ClimatePreventiveMeasure option);
    void deleteClimatePreventiveMeasure(int id);
    void deleteClimatePreventiveMeasure(int pmId, int ciId);
    
    ClimateProjectRecordsModel findAllProjectRecords();
    
}
