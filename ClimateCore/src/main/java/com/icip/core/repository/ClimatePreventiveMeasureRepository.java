/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimatePreventiveMeasure;

/**
 *
 * @author icipmac
 */
public interface ClimatePreventiveMeasureRepository {
    ClimatePreventiveMeasure findClimatePreventiveMeasureById(int id);
    ClimatePreventiveMeasure updateClimatePreventiveMeasure(ClimatePreventiveMeasure option);
    void deleteClimatePreventiveMeasure(int id);
    
}
