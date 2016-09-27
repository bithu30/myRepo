/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipproject;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name = "climate_impact")
public class ClimateImpact {
    @Id
    @GeneratedValue
    private int Id;
    @Column(unique = true)
    private String name;
    private String description;
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name="ClimateImpact_ClimatePreventiveMeasure", 
				joinColumns={@JoinColumn(name="ClimateImpact_ID")}, 
				inverseJoinColumns={@JoinColumn(name="ClimatePreventiveMeasure_ID")})
    private Set<ClimatePreventiveMeasure> preventiveMeasures = new HashSet<ClimatePreventiveMeasure>();

    public ClimateImpact() {
    }

    public ClimateImpact(String name, String description) {
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

    public Set<ClimatePreventiveMeasure> getPreventiveMeasures() {
        return preventiveMeasures;
    }

    public void setPreventiveMeasures(Set<ClimatePreventiveMeasure> preventiveMeasures) {
        this.preventiveMeasures = preventiveMeasures;
    }
    
    
    
    
    
}
