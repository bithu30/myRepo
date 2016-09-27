/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipproject;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author icipmac
 */
@Entity 
@Table(name = "climate_option_type")
public class ClimateOptionType {
    @Id
    @GeneratedValue
    private int Id;
    private String name;
    private String description;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "climate_option_type_fk") 
    private Set<ClimateOption> options = new HashSet<ClimateOption>();

    public ClimateOptionType() {
    }

    public ClimateOptionType( String name, String description) {      
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

    public Set<ClimateOption> getOptions() {
        return options;
    }

    public void setOptions(Set<ClimateOption> options) {
        this.options = options;
    }
    
    
    
    
}
