/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimatePreventiveMeasure;
import java.util.List;

/**
 *
 * @author icipmac
 */
public interface ClimateImpactRepository {
    ClimateImpact findClimateImpactById(int id);
    ClimateImpact createClimateImpact(ClimateImpact impact);
    ClimateImpact updateClimateImpact(ClimateImpact impact);
    ClimatePreventiveMeasure addClimatePreventiveMeasure(int climateImpactid, ClimatePreventiveMeasure preventiveMeasure);
    List<ClimateImpact> findAllClimateImpacts();
    void deleteClimateImpact(int id);
}
