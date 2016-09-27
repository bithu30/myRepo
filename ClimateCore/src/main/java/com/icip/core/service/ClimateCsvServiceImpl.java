/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.model.ClimateCsvModel;
import com.icip.core.repository.ClimateCsvRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author icipmac
 */
@Service("climateCsvService")
public class ClimateCsvServiceImpl implements ClimateCsvService{
    
    @Autowired
    private ClimateCsvRepository climateCsvRepository;

    @Override
    public ClimateCsvModel getCsvRecords(String start_yr, String end_yr, String var, String whatTimeSpan) {
        ClimateCsvModel m = new ClimateCsvModel();
        m.setResults(this.climateCsvRepository.getCSVrecords(start_yr, end_yr, var, whatTimeSpan));
        return m;
    }
    
}
