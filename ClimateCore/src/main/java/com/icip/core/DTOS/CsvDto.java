/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.DTOS;

/**
 *
 * @author icipmac
 */
public class CsvDto {
   
    private double mean_val;
    private double lon;
    private double lat;

   

    public CsvDto() {
    }

    public CsvDto(double mean_val, double lon, double lat) {
        this.mean_val = mean_val;
        this.lon = lon;
        this.lat = lat;
    }
    
    
    

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getMean_val() {
        return mean_val;
    }

    public void setMean_val(double mean_val) {
        this.mean_val = mean_val;
    }

  
    
    
}
