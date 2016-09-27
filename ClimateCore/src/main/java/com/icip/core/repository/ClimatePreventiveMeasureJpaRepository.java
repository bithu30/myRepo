/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimatePreventiveMeasure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climatePreventiveMeasureJpaRepository")
public interface ClimatePreventiveMeasureJpaRepository extends JpaRepository<ClimatePreventiveMeasure, Integer> {
    
}
