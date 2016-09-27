/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.feedback.ICIPFeedback;
import com.icip.core.repository.ClimateFeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Service("climateFeedbackService")
@Transactional
public class ClimateFeedbackServiceImpl implements ClimateFeedbackService {

    @Autowired
    private ClimateFeedbackRepository climateFeedbackRepository; 
    
    @Override
    public ICIPFeedback createFeedback(ICIPFeedback feedback) {
        return this.climateFeedbackRepository.createFeedback(feedback);
    }
    
}
