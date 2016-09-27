/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.utils;

import com.icip.core.climateRecord.ClimateRecord;
import java.util.Comparator;

/**
 *
 * @author icipmac
 */
public class ResultComparator implements Comparator<ClimateRecord>{

    @Override
    public int compare(ClimateRecord o1, ClimateRecord o2) {
        
        if(o1.getMean_val() < o2.getMean_val()) {return -1;}
        else if(o1.getMean_val() > o2.getMean_val()){return 1;}       
        return 0;
    }
    
}
