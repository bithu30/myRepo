/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.model;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimateOptionType;
import java.util.List;

/**
 *
 * @author icipmac
 */
public class ClimateProjectRecordsModel {
    private List<ClimateOptionType> optionTypes;
    private List<ClimateImpact> impacts;

    public List<ClimateOptionType> getOptionTypes() {
        return optionTypes;
    }

    public void setOptionTypes(List<ClimateOptionType> optionTypes) {
        this.optionTypes = optionTypes;
    }

    public List<ClimateImpact> getImpacts() {
        return impacts;
    }

    public void setImpacts(List<ClimateImpact> impacts) {
        this.impacts = impacts;
    }
    
    
}
