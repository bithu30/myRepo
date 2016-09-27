/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.icipproject.ClimateImpact;
import com.icip.core.icipproject.ClimateOption;
import com.icip.core.icipproject.ClimateOptionType;
import com.icip.core.icipproject.ClimatePreventiveMeasure;
import com.icip.core.model.ClimateProjectRecordsModel;
import com.icip.core.repository.ClimateImpactRepository;
import com.icip.core.repository.ClimateOptionRepository;
import com.icip.core.repository.ClimateOptionTypeRepository;
import com.icip.core.repository.ClimatePreventiveMeasureRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Transactional
@Service("climateProjectService")
public class ClimateProjectServiceImpl implements ClimateProjectService{
    
    @Autowired
    private ClimateOptionTypeRepository climateOptionTypeRepository; 
    
    @Autowired
    private ClimateOptionRepository climateOptionRepository;
    
    @Autowired
    private ClimatePreventiveMeasureRepository climatePreventiveMeasureRepository;
    
    @Autowired
    private ClimateImpactRepository climateImpactRepository;

    // OPTION TYPE START
    // <editor-fold defaultstate="collapsed" desc="OPTION TYPE">
    @Override
    public ClimateOptionType findClimateOptionTypeById(int id) {
        return this.climateOptionTypeRepository.findClimateOptionTypeById(id);
    }

    @Override
    @Transactional
    public ClimateOptionType createClimateOptionType(ClimateOptionType type) {
        return this.climateOptionTypeRepository.createClimateOptionType(type);
    }

    @Override
    @Transactional
    public ClimateOptionType updateClimateOptionType(ClimateOptionType type) {
       return this.climateOptionTypeRepository.updateClimateOptionType(type);
    }

    @Override
    @Transactional
    public ClimateOption addClimateOption(int climateOptionTypeid, ClimateOption option) {
         return this.climateOptionTypeRepository.addClimateOption(climateOptionTypeid, option);
    }

    @Override
    public List<ClimateOptionType> findAllOptionClimateTypes() {
        return this.climateOptionTypeRepository.findAllOptionClimateTypes();
    }

    @Override
    @Transactional
    public void deleteClimateOptionType(int id) {
        this.climateOptionTypeRepository.deleteClimateOptionType(id);
    }
    // </editor-fold>
    // OPTION TYPE END

    // Climate Option starts
    // <editor-fold defaultstate="collapsed" desc="OPTION">
    @Override
    public ClimateOption findClimateOptionById(int id) {
        return this.climateOptionRepository.findClimateOptionById(id);
    }

    @Override
    @Transactional
    public ClimateOption updateClimateOption(ClimateOption option) {
        return this.climateOptionRepository.updateClimateOption(option);
    }

    @Override
    @Transactional
    public void deleteClimateOption(int id) {
        this.climateOptionRepository.deleteClimateOption(id);
    }
    // </editor-fold>
    //Climate option ends

    // Climate impact 
    // <editor-fold defaultstate="collapsed" desc="Climate Impact">
    @Override
    public ClimateImpact findClimateImpactById(int id) {
        return this.climateImpactRepository.findClimateImpactById(id);
    }

    @Override
    @Transactional
    public ClimateImpact createClimateImpact(ClimateImpact impact) {
        return this.climateImpactRepository.createClimateImpact(impact);
    }

    @Override
    @Transactional
    public ClimateImpact updateClimateImpact(ClimateImpact impact) {
        return this.climateImpactRepository.updateClimateImpact(impact);
    }

    @Override
    @Transactional
    public ClimatePreventiveMeasure addClimatePreventiveMeasure(int climateImpactid, ClimatePreventiveMeasure preventiveMeasure) {
        return this.climateImpactRepository.addClimatePreventiveMeasure(climateImpactid, preventiveMeasure);
    }

    @Override
    public List<ClimateImpact> findAllClimateImpacts() {
        return this.climateImpactRepository.findAllClimateImpacts();
    }

    @Override
    @Transactional
    public void deleteClimateImpact(int id) {
        this.climateImpactRepository.deleteClimateImpact(id);
    }
    // </editor-fold>
    // Climate Impact ends

    // climate preventive measure 
    
    @Override
    public ClimatePreventiveMeasure findClimatePreventiveMeasureById(int id) {
        return this.climatePreventiveMeasureRepository.findClimatePreventiveMeasureById(id);
    }

    @Override
    @Transactional
    public ClimatePreventiveMeasure updateClimatePreventiveMeasure(ClimatePreventiveMeasure option) {
        return this.climatePreventiveMeasureRepository.updateClimatePreventiveMeasure(option);
    }

    @Override
    @Transactional
    public void deleteClimatePreventiveMeasure(int id) {
        this.climatePreventiveMeasureRepository.deleteClimatePreventiveMeasure(id);
    }
    
    // end cliumate preventive measure 

    @Override
    @Transactional
    public ClimateProjectRecordsModel findAllProjectRecords() {
        ClimateProjectRecordsModel cprm = new ClimateProjectRecordsModel();
        
        cprm.setOptionTypes(this.climateOptionTypeRepository.findAllOptionClimateTypes());
        cprm.setImpacts(this.climateImpactRepository.findAllClimateImpacts());
        
        return cprm;
    }

    @Override
    public void deleteClimatePreventiveMeasure(int pmId, int ciId) {
        ClimateImpact ci = this.climateImpactRepository.findClimateImpactById(ciId);
        
        for(ClimatePreventiveMeasure cpm : ci.getPreventiveMeasures()){
            if(cpm.getId() == pmId){
                ci.getPreventiveMeasures().remove(cpm);
                break;
            }
        }
        
        this.climateImpactRepository.updateClimateImpact(ci);
        
        this.climatePreventiveMeasureRepository.deleteClimatePreventiveMeasure(pmId);
        
    }
    
    
}
