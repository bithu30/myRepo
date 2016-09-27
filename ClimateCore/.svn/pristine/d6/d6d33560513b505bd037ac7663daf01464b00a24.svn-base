/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateOption;
import com.icip.core.icipproject.ClimateOptionType;
import java.util.List;

/**
 *
 * @author icipmac
 */
public interface ClimateOptionTypeRepository {
    ClimateOptionType findClimateOptionTypeById(int id);
    ClimateOptionType createClimateOptionType(ClimateOptionType type);
    ClimateOptionType updateClimateOptionType(ClimateOptionType type);
    ClimateOption addClimateOption(int climateOptionTypeid, ClimateOption option);
    List<ClimateOptionType> findAllOptionClimateTypes();
    void deleteClimateOptionType(int id);
}
