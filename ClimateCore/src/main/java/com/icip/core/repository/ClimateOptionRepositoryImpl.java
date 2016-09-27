/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateOption;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 * Saving is done using Climate Option Type update 
 */
@Repository("climateOptionRepository")
public class ClimateOptionRepositoryImpl implements ClimateOptionRepository{

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ClimateOptionJpaRepository climateOptionTypeRepository;
    
    @Override
    public ClimateOption findClimateOptionById(int id) {
        return this.climateOptionTypeRepository.findOne(id);
    }

    @Override
    public ClimateOption updateClimateOption(ClimateOption option) {
        ClimateOption o = this.climateOptionTypeRepository.findOne(option.getId());
        
        o.setDescription(option.getDescription());
        o.setName(option.getName());
        o.setValue(option.getValue());
        
        return this.climateOptionTypeRepository.save(o);
        
    }

    @Override
    public void deleteClimateOption(int id) {
        this.climateOptionTypeRepository.delete(this.climateOptionTypeRepository.findOne(id));
    }
    
}
