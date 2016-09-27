///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.icip.core.icipproject;
//
//import java.util.HashSet;
//import java.util.Set;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
///**
// *
// * @author icipmac
// */
//@Entity
//@Table(name = "climate_configuration")
//public class ClimateConfiguration {
//    @Id
//    @GeneratedValue
//    private long Id;
//    private int optionType;
//    private int capacityBuilding;
//    
//    private int riskManagment;
//    
//    private boolean isShort;
//    private boolean isMedium;
//    private boolean isLong;
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "climatePreventiveMeasure_id")
//    private ClimatePreventiveMeasure climatePreventiveMeasure;
//    @OneToMany(fetch = FetchType.EAGER)
//    @JoinColumn(name = "climate_option_type_fk") 
//    private Set<ClimatePreventiveMeasuresConfgurationValues> oprtionConfigurationValues = new HashSet<ClimatePreventiveMeasuresConfgurationValues>();
//
//    public ClimateConfiguration() {
//    }
//       
//    public ClimateConfiguration(int optionType, int CapacityBuilding, int RiskManagment, boolean isShort, boolean isMedium, boolean isLong, ClimatePreventiveMeasure climatePreventiveMeasure) {
//        this.optionType = optionType;
//        this.capacityBuilding = CapacityBuilding;
//        this.riskManagment = RiskManagment;
//        this.isShort = isShort;
//        this.isMedium = isMedium;
//        this.isLong = isLong;
//        this.climatePreventiveMeasure = climatePreventiveMeasure;
//    }
//    
//    
//    
//    public long getId() {
//        return Id;
//    }
//
//    public void setId(long Id) {
//        this.Id = Id;
//    }
//
//    public int getOptionType() {
//        return optionType;
//    }
//
//    public void setOptionType(int optionType) {
//        this.optionType = optionType;
//    }
//
//    public int getCapacityBuilding() {
//        return capacityBuilding;
//    }
//
//    public void setCapacityBuilding(int CapacityBuilding) {
//        this.capacityBuilding = CapacityBuilding;
//    }
//
//    public int getRiskManagment() {
//        return riskManagment;
//    }
//
//    public void setRiskManagment(int RiskManagment) {
//        this.riskManagment = RiskManagment;
//    }
//
//    public boolean isIsShort() {
//        return isShort;
//    }
//
//    public void setIsShort(boolean isShort) {
//        this.isShort = isShort;
//    }
//
//    public boolean isIsMedium() {
//        return isMedium;
//    }
//
//    public void setIsMedium(boolean isMedium) {
//        this.isMedium = isMedium;
//    }
//
//    public boolean isIsLong() {
//        return isLong;
//    }
//
//    public void setIsLong(boolean isLong) {
//        this.isLong = isLong;
//    }
//
//    public ClimatePreventiveMeasure getClimatePreventiveMeasure() {
//        return climatePreventiveMeasure;
//    }
//
//    public void setClimatePreventiveMeasure(ClimatePreventiveMeasure climatePreventiveMeasure) {
//        this.climatePreventiveMeasure = climatePreventiveMeasure;
//    }
//
//    public Set<ClimatePreventiveMeasuresConfgurationValues> getOprtionConfigurationValues() {
//        return oprtionConfigurationValues;
//    }
//
//    public void setOprtionConfigurationValues(Set<ClimatePreventiveMeasuresConfgurationValues> oprtionConfigurationValues) {
//        this.oprtionConfigurationValues = oprtionConfigurationValues;
//    }
//    
//    
//    
//}
