/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipresult;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name="icipscenarioresult")
public class ICIPScenarioResult {

    public ICIPScenarioResult() {
    }

    public ICIPScenarioResult(String modelNameG, String modelNameR, String scenario, String resolution, int start_yr, int end_yr, String months, String variable_name, double min_val, double mean_val, double max_val) {
        this.modelNameG = modelNameG;
        this.modelNameR = modelNameR;
        this.scenario = scenario;
        this.resolution = resolution;
        this.start_yr = start_yr;
        this.end_yr = end_yr;
        this.months = months;
        this.variable_name = variable_name;
        this.min_val = min_val;
        this.mean_val = mean_val;
        this.max_val = max_val;
    }
    
    
    
    @Id
    @GeneratedValue
    private int ID;
    
    @Column(name = "modelNameG", nullable = false, length = 20)
    private String modelNameG;

    @Column(name = "modelNameR", nullable = false, length = 20)
    private String modelNameR;

    @Column(name = "scenario", nullable = false, length = 10)
    private String scenario;

    @Column(name = "resolution", nullable = false, length = 10)
    private String resolution;

    @Column(name = "start_yr", nullable = false, length = 4)
    private int start_yr;

    @Column(name = "end_yr", nullable = false, length = 4)
    private int end_yr;

    @Column(name = "months", nullable = false, length = 3)
    private String months;

    @Column(name = "variable_name", nullable = false, length = 30)
    private String variable_name;

    @Column(name = "min_val", nullable = false)
    private double min_val;
    
     @Column(name = "mean_val", nullable = false)
    private double mean_val;

    @Column(name = "max_val", nullable = false)
    private double max_val;
    
    
    
    
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getModelNameG() {
        return modelNameG;
    }

    public void setModelNameG(String modelNameG) {
        this.modelNameG = modelNameG;
    }

    public String getModelNameR() {
        return modelNameR;
    }

    public void setModelNameR(String modelNameR) {
        this.modelNameR = modelNameR;
    }

    public String getScenario() {
        return scenario;
    }

    public void setScenario(String scenario) {
        this.scenario = scenario;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public int getStart_yr() {
        return start_yr;
    }

    public void setStart_yr(int start_yr) {
        this.start_yr = start_yr;
    }

    public int getEnd_yr() {
        return end_yr;
    }

    public void setEnd_yr(int end_yr) {
        this.end_yr = end_yr;
    }

    public String getMonths() {
        return months;
    }

    public void setMonths(String months) {
        this.months = months;
    }

    public String getVariable_name() {
        return variable_name;
    }

    public void setVariable_name(String variable_name) {
        this.variable_name = variable_name;
    }

    public double getMin_val() {
        return min_val;
    }

    public void setMin_val(double min_val) {
        this.min_val = min_val;
    }

    public double getMean_val() {
        return mean_val;
    }

    public void setMean_val(double mean_val) {
        this.mean_val = mean_val;
    }

    public double getMax_val() {
        return max_val;
    }

    public void setMax_val(double max_val) {
        this.max_val = max_val;
    }

   
    
}
