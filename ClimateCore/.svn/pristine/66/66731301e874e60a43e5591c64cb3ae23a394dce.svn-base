/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.model;

import static ch.lambdaj.Lambda.*;
import com.icip.core.DTOS.ResultDto;
import com.icip.core.ENUMS.CalculationTypeEnum;
import com.icip.core.climateRecord.ClimateRecord;
import com.icip.utils.ResultDtoUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hamcrest.Matchers;


/**
 *
 * @author icipmac
 */
public class PointModel implements Serializable
{
    private List<String> scenarios;   
    private List<ClimateRecord> Records;   
    private List<ClimateRecord> Results;
    private String MainScenario;
    private List<ResultDto> DtoResults;
    //private List<ChartResultDto> ChartResults;
    private CalculationTypeEnum CalculationType;

    public void setCalculationType(CalculationTypeEnum CalculationType) {
        this.CalculationType = CalculationType;
    }
//    public List<ChartResultDto> getChartResults() {
//        return ChartResults;
//    }
//
//    public void setChartResults(List<ChartResultDto> ChartResults) {
//        this.ChartResults = ChartResults;
//    }   
   
    public void setScenarios(List<String> scenarios) {
        this.scenarios = scenarios;
    }
   
    public void setMainScenario(String MainScenario) {
        this.MainScenario = MainScenario;
    }
     
    public void setRecords(List<ClimateRecord> records)
    {
        this.Records = records; 
    }
    
    public List<ClimateRecord> getResults()
    {
        return Results;
    }
    
    public void setResults(List<ClimateRecord> results)
    {
        this.Results = results; 
    }
    
    
    public void CalculateAverages(
            int past_start_yr1, 
            int past_start_yr2, 
            int future_start_yr1, 
            int future_start_yr2)
    {

         this.DtoResults = new ArrayList<ResultDto>();
         
        Results= new ArrayList<ClimateRecord>();
        
        
        for(int i=0; i < this.scenarios.size() ;i++)
        {
            String dc = this.scenarios.get(i);
            ResultDto rdto = new ResultDto();
            
            if(dc.equalsIgnoreCase(MainScenario))
            {
                
                rdto.setIsMain(true);
                rdto.setIsPast(false);
                rdto.setScenarioName(dc);               
                
                rdto.setListFirstYears(select(Records, having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(this.MainScenario))
                .and(having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(future_start_yr1)))));
                                          
                rdto.setListSecondYears(select(Records, having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(this.MainScenario))
                .and(having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(future_start_yr2)))));
                                        
            }
            else if(dc.equalsIgnoreCase("C20") || dc.equalsIgnoreCase("C20-1")||dc.equalsIgnoreCase("C20-2"))
            {
              
                rdto.setIsMain(false);
                rdto.setIsPast(true);
                rdto.setScenarioName(dc);
                
              
                
                rdto.setListFirstYears(select(Records, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(past_start_yr1))));
 
                rdto.setListSecondYears(select(Records, having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(past_start_yr2))));
            }
            else // it is not needed
            {
 
                rdto.setIsMain(false);
                rdto.setIsPast(false);
                rdto.setScenarioName(dc);
                
                rdto.setListFirstYears(select(Records, having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(dc))
                .and(having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(future_start_yr1)))));

                rdto.setListSecondYears(select(Records, having(on(ClimateRecord.class).getScenario(), Matchers.equalToIgnoringCase(dc))
                .and(having(on(ClimateRecord.class).getStart_yr(), Matchers.equalTo(future_start_yr2)))));
            } 
            
            this.DtoResults.add(rdto);
        }
        
       
               ResultDto dpast = selectFirst(DtoResults, having(on(ResultDto.class).isIsPast(), Matchers.equalTo(true)));
               ResultDto dfut = selectFirst(DtoResults, having(on(ResultDto.class).isIsMain(), Matchers.equalTo(true)));
//               
                    this.Results = this.comparePastAndFuture(dpast, dfut);
        
//               for(int i =0; i < dpast.getListFirstYears().size() ;i++)
//               {
//                   ClimateRecord re = new ClimateRecord();
//                   re.setLon(dpast.getListFirstYears().get(i).getLon());
//                   re.setLat(dpast.getListFirstYears().get(i).getLat());
//                   
//                   double mean_val =    
//                       Math.abs(
//                       ((dfut.getListFirstYears().get(i).getMean_val() + dfut.getListSecondYears().get(i).getMean_val())/2)
//                       -
//                       ((dpast.getListFirstYears().get(i).getMean_val() + dpast.getListSecondYears().get(i).getMean_val())/2)
//                       );
//               
//                re.setMean_val(mean_val);
//                Results.add(re);
//               
//               }
                    
    }
    
    
    public void createResultForLowMwdiumHigh(
            int scenario, 
            int start_yr_past1, 
            int start_yr_past2,
            int start_yr_future1,
            int start_yr_future2)
    {
        List<List<ClimateRecord>> listOfLists = new ArrayList<List<ClimateRecord>>();
        
        this.DtoResults = new ArrayList<ResultDto>();
        if(scenario ==1)
        {
            
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            // RCPS
            ResultDto PAstDto = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "Hadgem2-ES", 1961, 1971);  
           // this.DtoResults.add(PAstDto);
            ResultDto Future = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "RCP45", "Hadgem2-ES", 2021, 2031);
            //this.DtoResults.add(Future);
            
            List<ClimateRecord> ResultsFirstPeriod1 = this.comparePastAndFuture(PAstDto, Future);
            listOfLists.add(ResultsFirstPeriod1);
            }
            
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDto1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "Hadgem2-ES", 1981, 1991);  
          //  this.DtoResults.add(PAstDto1);
            ResultDto Future1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "RCP45", "Hadgem2-ES", 2041, 2051);
          //  this.DtoResults.add(Future1);
            
            List<ClimateRecord> ResultsFirstPeriod2 = this.comparePastAndFuture(PAstDto1, Future1);
            listOfLists.add(ResultsFirstPeriod2);
            // END RCPS
            }
            
            // START B1-1
            
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoB11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1961, 1971, "CLM3");            
            ResultDto FutureB11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "B1-1", "ECHAM5", 2021, 2031);
            List<ClimateRecord> ResultsFirstPeriodB11 = this.comparePastAndFuture(PAstDtoB11, FutureB11);
            listOfLists.add(ResultsFirstPeriodB11);
            }
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoB112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1981, 1991, "CLM3");  
            ResultDto FutureB112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "B1-1", "ECHAM5", 2041, 2051);
            List<ClimateRecord> ResultsFirstPeriodB112= this.comparePastAndFuture(PAstDtoB112, FutureB112);
            listOfLists.add(ResultsFirstPeriodB112);
            }
            // END B1-1
            
            
            this.Results = this.CreateAverageForHighOrMediumToLowScenarios(listOfLists);
            
            
        }
        else if(scenario == 2)
        {    
            // RCPS
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDto = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "Hadgem2-ES", 1961, 1971);  
            ResultDto Future = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "RCP85", "Hadgem2-ES", 2021, 2031);
            List<ClimateRecord> ResultsFirstPeriod1 = this.comparePastAndFuture(PAstDto, Future);
            listOfLists.add(ResultsFirstPeriod1);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDto1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "Hadgem2-ES", 1981, 1991);  
            ResultDto Future1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "RCP85", "Hadgem2-ES", 2041, 2051);
            List<ClimateRecord> ResultsFirstPeriod2 = this.comparePastAndFuture(PAstDto1, Future1);
            listOfLists.add(ResultsFirstPeriod2);}
            // END RCPS
            
            // A1B
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoA1B = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "CGCM3.1", 1961, 1971);  
            ResultDto FutureA1B = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "A1B", "CGCM3.1", 2021, 2031);
            List<ClimateRecord> ResultsFirstPeriodA1B1 = this.comparePastAndFuture(PAstDtoA1B, FutureA1B);
            listOfLists.add(ResultsFirstPeriodA1B1);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoA1B1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "CGCM3.1", 1981, 1991);  
            ResultDto FutureA1B1 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "A1B", "CGCM3.1", 2041, 2051);
            List<ClimateRecord> ResultsFirstPeriodA1B2 = this.comparePastAndFuture(PAstDtoA1B1, FutureA1B1);
            listOfLists.add(ResultsFirstPeriodA1B2);}
            // END A1B
            
            // A2
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoA2 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "CGCM3.1", 1961, 1971);  
            ResultDto FutureA2 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "A2", "CGCM3.1", 2021, 2031);
            List<ClimateRecord> ResultsFirstPeriodA21 = this.comparePastAndFuture(PAstDtoA2, FutureA2);
            listOfLists.add(ResultsFirstPeriodA21);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoA21 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "C20", "CGCM3.1", 1981, 1991);  
            ResultDto FutureA21 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModel(Records, "A2", "CGCM3.1", 2041, 2051);
            List<ClimateRecord> ResultsFirstPeriodA22 = this.comparePastAndFuture(PAstDtoA21, FutureA21);
            listOfLists.add(ResultsFirstPeriodA22);}
            //END A2
            
            // A1B-1 CLM3
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoB11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1961, 1971, "CLM3");            
            ResultDto FutureB11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-1", "ECHAM5", 2021, 2031, "CLM3");
            List<ClimateRecord> ResultsFirstPeriodB11 = this.comparePastAndFuture(PAstDtoB11, FutureB11);
            listOfLists.add(ResultsFirstPeriodB11);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoB112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1981, 1991, "CLM3");  
            ResultDto FutureB112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-1", "ECHAM5", 2041, 2051, "CLM3");
            List<ClimateRecord> ResultsFirstPeriodB112= this.comparePastAndFuture(PAstDtoB112, FutureB112);
            listOfLists.add(ResultsFirstPeriodB112);}
            // END A1B-1
            
            // A1B-2 CLM3
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoA1B11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-2", "ECHAM5", 1961, 1971, "CLM3");            
            ResultDto FutureA1B11 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-2", "ECHAM5", 2021, 2031, "CLM3");
            List<ClimateRecord> ResultsFirstPeriodA1B11 = this.comparePastAndFuture(PAstDtoA1B11, FutureA1B11);
            listOfLists.add(ResultsFirstPeriodA1B11);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoA1B112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-2", "ECHAM5", 1981, 1991, "CLM3");  
            ResultDto FutureA1B112 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-2", "ECHAM5", 2041, 2051, "CLM3");
            List<ClimateRecord> ResultsFirstPeriodA1B112= this.comparePastAndFuture(PAstDtoA1B112, FutureA1B112);
            listOfLists.add(ResultsFirstPeriodA1B112);}
            // END A1B-2
            
            //A1B-1 CLM4
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoB11CLM4 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1961, 1971, "CLM4");            
            ResultDto FutureB11CLM4 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-1", "ECHAM5", 2021, 2031, "CLM4");
            List<ClimateRecord> ResultsFirstPeriodB11CLM4 = this.comparePastAndFuture(PAstDtoB11CLM4, FutureB11CLM4);
            listOfLists.add(ResultsFirstPeriodB11CLM4);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoB112CLM4 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-1", "ECHAM5", 1981, 1991, "CLM4");  
            ResultDto FutureB112CLM4 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-1", "ECHAM5", 2041, 2051, "CLM4");
            List<ClimateRecord> ResultsFirstPeriodB112CLM4= this.comparePastAndFuture(PAstDtoB112CLM4, FutureB112CLM4);
            listOfLists.add(ResultsFirstPeriodB112CLM4);}
            //END A1B-1 CLM4
            
            
            //A1B-2 CLM4
            if(start_yr_future1 == 2021 || start_yr_future1 == 5555){
            ResultDto PAstDtoB11CLM42 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-2", "ECHAM5", 1961, 1971, "CLM4");            
            ResultDto FutureB11CLM42 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-2", "ECHAM5", 2021, 2031, "CLM4");
            List<ClimateRecord> ResultsFirstPeriodB11CLM42 = this.comparePastAndFuture(PAstDtoB11CLM42, FutureB11CLM42);
            listOfLists.add(ResultsFirstPeriodB11CLM42);}
            
            if(start_yr_future1 == 2041 || start_yr_future1 == 5555){
            ResultDto PAstDtoB112CLM422 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "C20-2", "ECHAM5", 1981, 1991, "CLM4");  
            ResultDto FutureB112CLM422 = ResultDtoUtil.GetResultDtoWthGivenScenarioAndModelAndClm(Records, "A1B-2", "ECHAM5", 2041, 2051, "CLM4");
            List<ClimateRecord> ResultsFirstPeriodB112CLM422= this.comparePastAndFuture(PAstDtoB112CLM422, FutureB112CLM422);
            listOfLists.add(ResultsFirstPeriodB112CLM422);}
            // END A1B-2 CLM4
            
        
            this.Results = this.CreateAverageForHighOrMediumToLowScenarios(listOfLists);
 
        }
        
    
       
    }
    
    public List<ClimateRecord> CreateAverageForHighOrMediumToLowScenarios(List<List<ClimateRecord>> listOfListsP)
    {
        List<ClimateRecord> result = new ArrayList<ClimateRecord>();
        
        List<ClimateRecord> samplelist = listOfListsP.get(0);
        
        for(int i =0;i< samplelist.size();i++){
        
            ClimateRecord re = new ClimateRecord();
            double lon = samplelist.get(i).getLon();
            double lat = samplelist.get(i).getLat();
            double mean_val = 0;
            
            for (List<ClimateRecord> listOfListsP1 : listOfListsP) 
            {
                mean_val += listOfListsP1.get(i).getMean_val();
            }
            
            mean_val /= listOfListsP.size();
            
            re.setLon(lon);
            re.setLat(lat);
            re.setMean_val(mean_val);
            
            result.add(re);
        }
        
        return result;
    }
    
    
    public List<ClimateRecord> comparePastAndFuture(ResultDto dpast, ResultDto dfut)
    {
        List<ClimateRecord> result = new ArrayList<ClimateRecord>();
        
        for(int i =0; i < dpast.getListFirstYears().size() ;i++)
               {
                   ClimateRecord re = new ClimateRecord();
                   
                   double lon = dpast.getListFirstYears().get(i).getLon();
                   double lat = dpast.getListFirstYears().get(i).getLat();
                   
//                   double lon1 = dfut.getListFirstYears().get(i).getLon();
//                   double lat1 = dfut.getListFirstYears().get(i).getLat(); 
                   
                 
                       re.setLon(lon);
                       re.setLat(lat);
 
                       //<---- have to change this bit to include temperature and gust
                   double mean_val =  
                           CalculateMeanValue(
                                   dfut.getListFirstYears().get(i),
                                   dfut.getListSecondYears().get(i),
                                   dpast.getListFirstYears().get(i),
                                   dpast.getListSecondYears().get(i));
                      // Math.abs(
                      // ((dfut.getListFirstYears().get(i).getMean_val() + dfut.getListSecondYears().get(i).getMean_val())/2)
                      // -
                     //  ((dpast.getListFirstYears().get(i).getMean_val() + dpast.getListSecondYears().get(i).getMean_val())/2)
                      // );
                       //<---- end of it 
               
                re.setMean_val(mean_val);
                result.add(re);
               
               }
        
        // check for max and min 
      ///  double max = max(result, on(ClimateRecord.class).getMean_val());
      //  double min = min(result, on(ClimateRecord.class).getMean_val());
        
        
        
         return result;
    }
    
//    public void CalculateChartResults()
//    {
//        List<ChartResultDto> ChartResultsT = new ArrayList<ChartResultDto>();
//        
//        for(int i=0; i < this.DtoResults.size() ;i++)
//        {
//            ResultDto r = this.DtoResults.get(i);
//           
//            ChartResultDto crdto = new ChartResultDto();
//            crdto.setLabel(r.getScenarioName());
//            
//            int styr = r.getListFirstYears().get(0).getStart_yr();
//            int eyr = r.getListSecondYears().get(0).getEnd_yr();
//            
//            crdto.setStartYear(styr);
//            crdto.setName(styr +"-" +eyr);
//            
//            double firstAvg = (sumFrom(r.getListFirstYears()).getMean_val()) / r.getListFirstYears().size();
//            double SecondAvg = (sumFrom(r.getListSecondYears()).getMean_val()) / r.getListSecondYears().size();
//                
//                
//            double finalAvg = (firstAvg + SecondAvg) /2;
//            crdto.setValue(finalAvg - 273);          
//            
//            ChartResultsT.add(crdto);
//        }
//        
//        this.ChartResults = sort(ChartResultsT, on(ChartResultDto.class).getStartYear());
//    }
    
    
    private double CalculateMeanValue(ClimateRecord f1,ClimateRecord f2,ClimateRecord p1,ClimateRecord p2)
    {
        double result = 999;
        
        switch(this.CalculationType)
        {
            case AbsoluteValueScenarios:
                result =  //Math.abs(
                       ((f1.getMean_val() + f2.getMean_val())/2)
                       -
                       ((p1.getMean_val() + p2.getMean_val())/2)
                       ;
                break;
            case PercentageValueScenarios:
                double base = ((p1.getMean_val() + p2.getMean_val())/2);
                double future = ((f1.getMean_val() + f2.getMean_val())/2);
                double change = future - base;
                
                 result = (change/base)*100;
                
                break;
        }
        
        
        return result;
    }
}
