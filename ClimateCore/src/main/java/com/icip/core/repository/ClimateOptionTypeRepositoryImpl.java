/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipproject.ClimateOption;
import com.icip.core.icipproject.ClimateOptionType;
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
@Repository("climateOptionTypeRepository")
public class ClimateOptionTypeRepositoryImpl implements ClimateOptionTypeRepository {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ClimateOptionTypeJpaRepository climateOptionTypeJpaRepository;

    @Override
    public ClimateOptionType findClimateOptionTypeById(int id) {
        return this.climateOptionTypeJpaRepository.findOne(id);
    }

    @Override
    public ClimateOptionType createClimateOptionType(ClimateOptionType type) {
        return this.climateOptionTypeJpaRepository.saveAndFlush(type);
    }

    @Override
    public ClimateOptionType updateClimateOptionType(ClimateOptionType type) {
        ClimateOptionType t = this.climateOptionTypeJpaRepository.findOne(type.getId());

        t.setDescription(type.getDescription());
        t.setName(type.getName());
      
        return this.climateOptionTypeJpaRepository.save(t);
    }

    @Override
    public ClimateOption addClimateOption(int climateOptionTypeid, ClimateOption option) {
        ClimateOptionType t = this.climateOptionTypeJpaRepository.findOne(climateOptionTypeid);
        
        t.getOptions().add(option);
        this.climateOptionTypeJpaRepository.save(t);
        
        int currVal =0;
        
        List<ClimateOption> list;
        list = new ArrayList<ClimateOption>(t.getOptions());
        
        for (ClimateOption list1 : list) {
            if (currVal < list1.getId()) {
                currVal = list1.getId();
            }
        }
        
        option.setId(currVal);
        
        return option;
    }

    @Override
    public List<ClimateOptionType> findAllOptionClimateTypes() {
         List<ClimateOptionType> all = this.climateOptionTypeJpaRepository.findAll();
         return all;
    }

    @Override
    public void deleteClimateOptionType(int id) {
        ClimateOptionType t = this.climateOptionTypeJpaRepository.findOne(id);
        this.climateOptionTypeJpaRepository.delete(t);
    }

}
