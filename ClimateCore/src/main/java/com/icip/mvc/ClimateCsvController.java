/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.mvc;

import com.icip.core.icipcsv.ClimateCSVRecord;
import com.icip.core.model.ClimateCsvModel;
import com.icip.core.service.ClimateCsvService;
import java.util.ArrayList;
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
@RequestMapping("/climatecsv")
public class ClimateCsvController {
    
    @Autowired
    private ClimateCsvService climateCsvService;
    
   @RequestMapping(value="/getcsv", method = RequestMethod.GET) 
   public ResponseEntity<?> findRecordById(HttpServletRequest request, HttpServletResponse response)
   {

       String[] splited = request.getParameter("period").split("-");
       String st_y = splited[0];
       String e_y = splited[1];
       String timeP = request.getParameter("timeP");
       String var = request.getParameter("varR");
       
       ClimateCsvModel model = this.climateCsvService.getCsvRecords(st_y, e_y, var, timeP);
       
      // ClimateRecord r = this.climateRecordService.findRecordById(5475101L);
       
       return new ResponseEntity<ClimateCsvModel>(model,HttpStatus.OK);
   }
}
