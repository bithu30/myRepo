/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.utils;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author icipmac
 */
public class ScenarioAndResolutionUtil {
    
    private final String model;
    private final String drivingdata;
    private String resolution;
    private List<String> scenarios;
    private String Maincenario;

    public ScenarioAndResolutionUtil() {
       model = "";
       drivingdata = "";
    }

    public String getMainScenario() {
        return Maincenario;
    }
    public void setMainScenario(String MainScenario) {
        this.Maincenario = MainScenario;
    }
    
    public String getResolution() {
        return resolution;
    }
    public void setResolution(String resolution) {
        this.resolution = resolution;
    }
    public List<String> getScenarios() {
        return scenarios;
    }
    public void setScenarios(List<String> scenarios) {
        this.scenarios = scenarios;
    }
    
    
    public ScenarioAndResolutionUtil(String model, String drivingdata, String mainScenario) {
        
        this.model = model;
        this.drivingdata = drivingdata;
        this.scenarios = new ArrayList<String>();
        this.Maincenario = mainScenario;
    }

   
    
    
    
    
    public void CreateListOfPossibleScenariosAndResolution()
    {
        if(this.model.equalsIgnoreCase("CLM4") && this.drivingdata.equalsIgnoreCase("CGCM3.1"))
        {
            this.setResolution("4km");
            this.scenarios.add("C20");
            this.scenarios.add(this.Maincenario);
           // this.scenarios.add("A1B");
           // this.scenarios.add("A2");
            
        }
        else if(this.model.equalsIgnoreCase("CLM4") && this.drivingdata.equalsIgnoreCase("Hadgem2-ES"))
        {
             this.setResolution("4km");
             this.scenarios.add("C20");
              this.scenarios.add(this.Maincenario);
           //  this.scenarios.add("RCP45");
            // this.scenarios.add("RCP85");
             
        }
        else if(this.model.equalsIgnoreCase("CLM4") 
                && this.drivingdata.equalsIgnoreCase("ECHAM5")
                &&(this.Maincenario.equalsIgnoreCase("A1B-1") || this.Maincenario.equalsIgnoreCase("B1")))
        {
            this.setResolution("7km");
            this.scenarios.add("C20-1");
            this.scenarios.add(this.Maincenario);
            //this.scenarios.add("A1B-1");
           // this.scenarios.add("B1");
        }
         else if(this.model.equalsIgnoreCase("CLM4") 
                && this.drivingdata.equalsIgnoreCase("ECHAM5")
                &&this.Maincenario.equalsIgnoreCase("A1B-2"))
        {
            this.setResolution("7km");
            this.scenarios.add("C20-2");
             this.scenarios.add(this.Maincenario);
            //this.scenarios.add("A1B-2");
        }
        else if(this.model.equalsIgnoreCase("CLM3") 
                && this.drivingdata.equalsIgnoreCase("ECHAM5")
                &&(this.Maincenario.equalsIgnoreCase("A1B-1") || this.Maincenario.equalsIgnoreCase("B1-1")))
        {
            this.setResolution("7km");
            this.scenarios.add("C20-1");
             this.scenarios.add(this.Maincenario);
           // this.scenarios.add("A1B-1");
           // this.scenarios.add("B1-1");
        }
         else if(this.model.equalsIgnoreCase("CLM3") 
                && this.drivingdata.equalsIgnoreCase("ECHAM5")
                &&this.Maincenario.equalsIgnoreCase("A1B-2"))
        {
            this.setResolution("7km");
            this.scenarios.add("C20-2");
             this.scenarios.add(this.Maincenario);
          //  this.scenarios.add("A1B-2");
        }
        
    }

    public List<String> getDrivingDataForLowMedimHigh(int simpleSc) {
        List<String> result = new ArrayList<String>();
        if(simpleSc == 1)
        {
            result.add("Hadgem2-ES");
            result.add("ECHAM5");
        }
        else if(simpleSc ==2)
        {
            result.add("Hadgem2-ES");
            result.add("CGCM3.1");
            result.add("ECHAM5");
        
        }
        
        return result;
    }

    public List<String> getScenariosForLowMedimHigh(int simpleSc) {
        List<String> result = new ArrayList<String>();
        if(simpleSc == 1)
        {
            result.add("RCP45");
           // result.add("B1");
            result.add("B1-1");
            result.add("C20");
            result.add("C20-1");
          //  result.add("C20-2");
            
        }
        else if(simpleSc ==2)
        {
            result.add("RCP85");
            result.add("A1B");
            result.add("A1B-1");
            result.add("A1B-2");
            result.add("A2");
            result.add("C20");
            result.add("C20-1");
            result.add("C20-2");
        }
        
        return result;
    }

    
    public List<String> getCLMSForLowMedimHigh() {
        List<String> result = new ArrayList<String>();
        
            result.add("CLM3");
            result.add("CLM4");
        return result;
    }
    
    
        
}
