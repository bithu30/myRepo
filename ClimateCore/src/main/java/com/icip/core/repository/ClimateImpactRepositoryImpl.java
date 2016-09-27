/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimatePreventiveMeasure;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climateImpactRepository")
public class ClimateImpactRepositoryImpl implements ClimateImpactRepository{
    
    @PersistenceContext
    private EntityManager em;
    
    @Autowired
    private ClimateImpactJpaRepository climateImpactJpaRepository;
    
    

    @Override
    public ClimateImpact findClimateImpactById(int id) {
        return this.climateImpactJpaRepository.findOne(id);
    }

    @Override
    public ClimateImpact createClimateImpact(ClimateImpact impact) {
        return this.climateImpactJpaRepository.saveAndFlush(impact);
    }

    @Override
    public ClimateImpact updateClimateImpact(ClimateImpact impact) {
        ClimateImpact ci = this.climateImpactJpaRepository.findOne(impact.getId());
        
        ci.setDescription(impact.getDescription());
        ci.setName(impact.getName());
        
        return this.climateImpactJpaRepository.save(ci);
    }

    @Override
    public ClimatePreventiveMeasure addClimatePreventiveMeasure(int climateImpactid, ClimatePreventiveMeasure preventiveMeasure) {
        ClimateImpact ci = this.climateImpactJpaRepository.findOne(climateImpactid);
        
        ci.getPreventiveMeasures().add(preventiveMeasure);
        this.climateImpactJpaRepository.saveAndFlush(ci);
        int currVal =0;
        
        List<ClimatePreventiveMeasure> list;
        list = new ArrayList<ClimatePreventiveMeasure>(ci.getPreventiveMeasures());
        
        for (ClimatePreventiveMeasure list1 : list) {
            if (currVal < list1.getId()) {
                currVal = list1.getId();
            }
        }
        
        preventiveMeasure.setId(currVal);
        
        return preventiveMeasure;
    }

    @Override
    public List<ClimateImpact> findAllClimateImpacts() {
        return this.climateImpactJpaRepository.findAll();
    }

    @Override
    public void deleteClimateImpact(int id) {
        this.climateImpactJpaRepository.delete(this.climateImpactJpaRepository.findOne(id));
    }
    
}
