/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.survey.ICIPSurveyGel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("iCIPSurveyGelRepository")
public class ICIPSurveyGelRepositoryImpl implements ICIPSurveyGelRepository {

    @Autowired
    private ICIPSurveyGelJpaRepository iCIPSurveyGelJpaRepository;
    
    @Override
    public ICIPSurveyGel create(ICIPSurveyGel survey) {
        return this.iCIPSurveyGelJpaRepository.saveAndFlush(survey);
    }
    
}
