/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateOption;

/**
 *
 * @author icipmac
 */
public interface ClimateOptionRepository {
    ClimateOption findClimateOptionById(int id);
    ClimateOption updateClimateOption(ClimateOption option);
    void deleteClimateOption(int id);
}
