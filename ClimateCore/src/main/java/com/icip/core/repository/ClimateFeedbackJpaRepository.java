/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.feedback.ICIPFeedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climateFeedbackJpaRepository")
interface ClimateFeedbackJpaRepository extends JpaRepository<ICIPFeedback, Long> {
    //public ICIPFeedback findByEmail(String emial);
}