/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipproject;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name = "climate_option")
public class ClimateOption {
    @Id
    @GeneratedValue
    private int Id;   
    private String name;
    private String description;
    private int optionValue;
  

    public ClimateOption() {
    }

    public ClimateOption(String name, String description, int value) {
        this.name = name;
        this.description = description;
        this.optionValue = value;    
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

    public int getValue() {
        return optionValue;
    }

    public void setValue(int value) {
        this.optionValue = value;
    }

 
    
    
    
}
