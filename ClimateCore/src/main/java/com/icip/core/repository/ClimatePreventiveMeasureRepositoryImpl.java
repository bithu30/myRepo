/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimatePreventiveMeasure;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climatePreventiveMeasureRepository")
public class ClimatePreventiveMeasureRepositoryImpl implements ClimatePreventiveMeasureRepository{

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ClimatePreventiveMeasureJpaRepository climatePreventiveMeasureJpaRepository;
    
    @Override
    public ClimatePreventiveMeasure findClimatePreventiveMeasureById(int id) {
       return this.climatePreventiveMeasureJpaRepository.findOne(id);
    }

    @Override
    public ClimatePreventiveMeasure updateClimatePreventiveMeasure(ClimatePreventiveMeasure option) {
        ClimatePreventiveMeasure cpo = this.climatePreventiveMeasureJpaRepository.findOne(option.getId());
        
        cpo.setDescription(option.getDescription());
        cpo.setName(option.getName());
        
        this.climatePreventiveMeasureJpaRepository.save(cpo);
        
        return cpo;
    }

    @Override
    public void deleteClimatePreventiveMeasure(int id) {
         this.climatePreventiveMeasureJpaRepository.delete(this.climatePreventiveMeasureJpaRepository.findOne(id));
    }

   
    
}
