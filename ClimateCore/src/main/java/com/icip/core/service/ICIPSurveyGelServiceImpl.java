/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.repository.ICIPSurveyGelRepository;
import com.icip.core.survey.ICIPSurveyGel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Service("ICIPSurveyGelService")
public class ICIPSurveyGelServiceImpl implements ICIPSurveyGelService{

    @Autowired
    private ICIPSurveyGelRepository iCIPSurveyGelRepository;
    
    @Override
    @Transactional
    public ICIPSurveyGel createSurvey(ICIPSurveyGel survey) {
        return this.iCIPSurveyGelRepository.create(survey);
    }
    
}
