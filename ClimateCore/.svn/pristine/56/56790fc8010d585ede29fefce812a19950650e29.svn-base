/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipproject;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name = "climate_preventive_measure")
public class ClimatePreventiveMeasure {
    @Id
    @GeneratedValue
    private int Id;
    private String name;
    private String description;
    @Transient
    @ManyToMany(mappedBy="preventiveMeasures")
    private Set<ClimateImpact> impacts = new HashSet<ClimateImpact>();

    public ClimatePreventiveMeasure() {
    }

    public ClimatePreventiveMeasure(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<ClimateImpact> getImpacts() {
        return impacts;
    }

    public void setImpacts(Set<ClimateImpact> impacts) {
        this.impacts = impacts;
    }
    
    
    
    
}
