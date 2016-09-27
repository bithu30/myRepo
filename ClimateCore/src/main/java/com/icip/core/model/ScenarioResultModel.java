/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.model;


import com.icip.core.icipresult.ICIPScenarioResult;
import java.util.List;

/**
 *
 * @author icipmac
 */
public class ScenarioResultModel {

    public List<ICIPScenarioResult> getScenarioResults() {
        return ScenarioResults;
    }

    public void setScenarioResults(List<ICIPScenarioResult> ScenarioResults) {
        this.ScenarioResults = ScenarioResults;
    }
    
    private List<ICIPScenarioResult> ScenarioResults;
}
