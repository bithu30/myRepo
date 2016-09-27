/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.mvc;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimateOption;
import com.icip.core.icipproject.ClimateOptionType;
import com.icip.core.icipproject.ClimatePreventiveMeasure;
import com.icip.core.model.ClimateProjectRecordsModel;
import com.icip.core.service.ClimateProjectService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author icipmac
 */
@RestController
@RequestMapping("/climateproject")
public class ClimateProjectController {
    
    @Autowired
    private ClimateProjectService climateProjectService;
        
    @RequestMapping(value="/test", method = RequestMethod.GET)
    public ResponseEntity<?> login(HttpServletRequest request, HttpServletResponse response)
    {
        
        // CREATE WORKS
//        ClimateOptionType t = new ClimateOptionType();
//        t.setDescription("some description");
//        t.setName("Option Type");
//        
//        this.climateProjectService.createClimateOptionType(t);
//        
//        ClimateOptionType t2 = new ClimateOptionType();
//        t2.setDescription("some description 2");
//        t2.setName("Option Type2");
//        this.climateProjectService.createClimateOptionType(t2);
        //
        
        // FIND BY ID
        
     //   ClimateOptionType t1 = this.climateProjectService.findClimateOptionTypeById(91);
     //   t1.setDescription("updated description");
    //    ClimateOptionType tup = this.climateProjectService.updateClimateOptionType(t1);
        
     //   List<ClimateOptionType> list = this.climateProjectService.findAll();
        
  

        
     //  this.climateProjectService.deleteClimateOptionType(93);
     //   this.climateProjectService.deleteClimateOptionType(94);
        
//        ClimateOption co = new ClimateOption();
 //       co.setDescription("option description");
 //       co.setName("option name");
 //       co.setValue(5);
        
 //       ClimateOption osaved =this.climateProjectService.addClimateOption(91, co);
        
        
 //       List<ClimateOptionType> list = this.climateProjectService.findAll();
//        
 //       if(osaved != null){n 
 //           return new ResponseEntity<ClimateOption>(osaved,HttpStatus.OK);
 //      }
        
        
//        ClimateOptionType t = this.climateProjectService.findClimateOptionTypeById(91);
//        Object[] l = t.getOptions().toArray();
//        ClimateOption o = (ClimateOption)l[0];
//        o.setName("updated name again");
//        this.climateProjectService.updateClimateOption(o);
        
       // this.climateProjectService.deleteClimateOption(95);
        
//        ClimateImpact ci = new ClimateImpact();
//        ci.setName("Climate impact 5");
//        ci.setDescription("Climate Impact desc 5");
        
//       this.climateProjectService.createClimateImpact(ci);
        
        
        
       // ci.setDescription("updated desc");
        
       // this.climateProjectService.updateClimateImpact(ci);
        
       // ClimateImpact cir = this.climateProjectService.findClimateImpactById(ci.getId());
        
        
        
//        ClimatePreventiveMeasure cpm = new ClimatePreventiveMeasure();
//        cpm.setDescription("Sea WALL");
//        cpm.setName("Sea dog");
        
//        this.climateProjectService.addClimatePreventiveMeasure(ci.getId(), cpm);
        
        
        
        List<ClimateImpact> list = this.climateProjectService.findAllClimateImpacts();
        
        

        return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
    }
    
    @RequestMapping(value="/getrecords", method = RequestMethod.GET)
    public ResponseEntity<?> getrecords(HttpServletRequest request, HttpServletResponse response)
    {
        ClimateProjectRecordsModel m = this.climateProjectService.findAllProjectRecords();
        if(m != null){
            return new ResponseEntity<ClimateProjectRecordsModel>(m,HttpStatus.OK);
        }
        
        return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
    }
    
    @RequestMapping(value="/createrecord", method = RequestMethod.POST)
    public ResponseEntity<?> createrecord(HttpServletRequest request, HttpServletResponse response) 
    {
       
        int ref = Integer.parseInt(request.getParameter("ref"));
        String name = request.getParameter("Name");
        String desc = request.getParameter("Description");
        

        switch (ref) {
            case 1:
                ClimateOptionType cot = 
                        this.climateProjectService.createClimateOptionType(new ClimateOptionType(name, desc));
                if(cot.getId() > 0){
                    return new ResponseEntity<ClimateOptionType>(cot,HttpStatus.OK);
                }
                     break;
            case 2:
             
                int typeId = Integer.parseInt(request.getParameter("SelectedOptionType"));
                int optionValue = Integer.parseInt(request.getParameter("OptionNumericValue"));
                ClimateOption co = this.climateProjectService.addClimateOption(typeId, new ClimateOption(name, desc, optionValue));
                
                if(co.getId() > 0){
                    return new ResponseEntity<ClimateOption>(co,HttpStatus.OK);
                }
                
                     break;
            case 3:
                ClimateImpact ci = 
                        this.climateProjectService.createClimateImpact(new ClimateImpact(name, desc));
                if(ci.getId() > 0){
                    return new ResponseEntity<ClimateImpact>(ci,HttpStatus.OK);
                }
                     break;
            case 4:
                
                int sciId = Integer.parseInt(request.getParameter("SelectedImpact"));
                ClimatePreventiveMeasure cpm = 
                        this.climateProjectService.addClimatePreventiveMeasure(sciId, 
                                new ClimatePreventiveMeasure(name,desc));
                
                if(cpm != null){
                    
                    return new ResponseEntity<ClimatePreventiveMeasure>(cpm,HttpStatus.OK);
                }
                
                     break;
            default:
                return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
                
        }
        
        return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
    }
    
    @RequestMapping(value="/updaterecord", method = RequestMethod.POST)
    public ResponseEntity<?> updaterecord(HttpServletRequest request, HttpServletResponse response) 
    {
       
        int ref = Integer.parseInt(request.getParameter("ref"));
        String name = request.getParameter("Name");
        String desc = request.getParameter("Description");
        int id = Integer.parseInt(request.getParameter("id"));
        

        switch (ref) {
            case 1:
                ClimateOptionType cot = new ClimateOptionType(name, desc);
                cot.setId(id);
                ClimateOptionType res = this.climateProjectService.updateClimateOptionType(cot);
                if(res != null){
                    return new ResponseEntity<ClimateOptionType>(res,HttpStatus.OK);
                }
                     break;
            case 2:
                int optionValue = Integer.parseInt(request.getParameter("OptionNumericValue"));
                ClimateOption co = new ClimateOption(name, desc, optionValue);
                co.setId(id);
                ClimateOption res2 = this.climateProjectService.updateClimateOption(co);
                
                if(res2 != null){
                    return new ResponseEntity<ClimateOption>(co,HttpStatus.OK);
                }
                
                     break;
            case 3:
                ClimateImpact ci = new ClimateImpact(name, desc);
                ci.setId(id);
                ClimateImpact res3 = this.climateProjectService.updateClimateImpact(ci);
                if(res3 != null){
                    return new ResponseEntity<ClimateImpact>(ci,HttpStatus.OK);
                }
                     break;
            case 4:
                
                ClimatePreventiveMeasure cpm = new ClimatePreventiveMeasure(name,desc);
                cpm.setId(id);
                ClimatePreventiveMeasure res4 = this.climateProjectService.updateClimatePreventiveMeasure(cpm);
                
                if(res4 != null){
                    return new ResponseEntity<ClimatePreventiveMeasure>(cpm,HttpStatus.OK);
                }
                
                     break;
            default:
                return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
                
        }
        
        return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
    }
    
    @RequestMapping(value="/deleterecord", method = RequestMethod.POST)
    public ResponseEntity<?> deleterecord(HttpServletRequest request, HttpServletResponse response) 
    {
       
        int ref = Integer.parseInt(request.getParameter("ref"));
        int id = Integer.parseInt(request.getParameter("id"));
        

        switch (ref) {
            case 1:               
               this.climateProjectService.deleteClimateOptionType(id);
               break;
            case 2:
               this.climateProjectService.deleteClimateOption(id);
                     break;
            case 3:
                this.climateProjectService.deleteClimateImpact(id);
                break;
            case 4:
                int ciId = Integer.parseInt(request.getParameter("climateImpactId"));
                this.climateProjectService.deleteClimatePreventiveMeasure(id, ciId);
                break;
            default:
                return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);
                
        }
        
        return  new ResponseEntity<String>("OK",HttpStatus.OK);
    }
    
}
