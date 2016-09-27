/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.model;

import com.icip.core.icipcsv.ClimateCSVRecord;
import java.util.List;

/**
 *
 * @author icipmac
 */
public class ClimateCsvModel {
    private List<ClimateCSVRecord> Results;

    public List<ClimateCSVRecord> getResults() {
        return Results;
    }

    public void setResults(List<ClimateCSVRecord> Results) {
        this.Results = Results;
    }
  
}
