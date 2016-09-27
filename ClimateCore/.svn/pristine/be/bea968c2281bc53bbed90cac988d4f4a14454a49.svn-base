/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.icipcsv;

import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.Point;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Type;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name="climate_csv_records")
public class ClimateCSVRecord {
    @Id
    @GeneratedValue
    private Long Id;
     @Column(name = "lon", nullable = false)
    private double lon;
    @Column(name = "lat", nullable = false)
    private double lat;
    private double m1;
    private double m2;
    private double m3;
    private double m4;
    private double m5;
    private double m6;
    private double m7;
    private double m8;
    private double m9;
    private double m10;
    private double m11;
    private double m12;
    private double annual_val;
    private double djf_winter;
    private double mam_spring;
    private double jja_summer;
    private double son_autumn;
    private int st_year;
    private int end_year;
    @Column(name = "variable_name", nullable = false, length = 30)
    private String variable_name;  
    @Column(name="LOC",columnDefinition="GEOMETRY", nullable = false)
    @Type(type="org.hibernate.spatial.GeometryType")
    private Point loc=null;

    public ClimateCSVRecord() {
    }

    public ClimateCSVRecord(double lon, double lat, 
            double m1, 
            double m2, 
            double m3, 
            double m4, 
            double m5, 
            double m6, 
            double m7, 
            double m8, 
            double m9, 
            double m10, 
            double m11, 
            double m12,
            double annual_val, 
            double djf_winter, 
            double mam_spring, 
            double jja_summer, 
            double son_autumn, int st_year, int end_year, String variable_name) {
        this.lon = lon;
        this.lat = lat;
        this.m1 = m1;
        this.m2 = m2;
        this.m3 = m3;
        this.m4 = m4;
        this.m5 = m5;
        this.m6 = m6;
        this.m7 = m7;
        this.m8 = m8;
        this.m9 = m9;
        this.m10 = m10;
        this.m11 = m11;
        this.m12 = m12;
        this.annual_val = annual_val;
        this.djf_winter = djf_winter;
        this.mam_spring = mam_spring;
        this.jja_summer = jja_summer;
        this.son_autumn = son_autumn;
        this.st_year = st_year;
        this.end_year = end_year;
        this.variable_name = variable_name;
        GeometryFactory gf = new GeometryFactory();
        //Coordinate coord = new Coordinate(this.lat, this.lon); // reversed lon lat
        Coordinate coord = new Coordinate(this.lon, this.lat);
        this.loc = gf.createPoint(coord);
    }

    
    
//    public ClimateCSVRecord(int st_year, int end_year, String variable_name, 
//            int m1, int m2, int m3, int m4, int m5, int m6, int m7, 
//            int m8, int m9, int m10, int m11, int m12, 
//            int annual_val, int djf_winter, int mam_spring, int jja_summer, 
//            int son_autumn, double lon, double lat) {
//        this.st_year = st_year;
//        this.end_year = end_year;
//        this.variable_name = variable_name;
//        this.m1 = m1;
//        this.m2 = m2;
//        this.m3 = m3;
//        this.m4 = m4;
//        this.m5 = m5;
//        this.m6 = m6;
//        this.m7 = m7;
//        this.m8 = m8;
//        this.m9 = m9;
//        this.m10 = m10;
//        this.m11 = m11;
//        this.m12 = m12;
//        this.annual_val = annual_val;
//        this.djf_winter = djf_winter;
//        this.mam_spring = mam_spring;
//        this.jja_summer = jja_summer;
//        this.son_autumn = son_autumn;
//        this.lon = lon;
//        this.lat = lat;
//        
//        GeometryFactory gf = new GeometryFactory();
//        //Coordinate coord = new Coordinate(this.lat, this.lon); // reversed lon lat
//        Coordinate coord = new Coordinate(this.lon, this.lat);
//        this.loc = gf.createPoint(coord);
//        
//    }

    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
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

    public double getM1() {
        return m1;
    }

    public void setM1(double m1) {
        this.m1 = m1;
    }

    public double getM2() {
        return m2;
    }

    public void setM2(double m2) {
        this.m2 = m2;
    }

    public double getM3() {
        return m3;
    }

    public void setM3(double m3) {
        this.m3 = m3;
    }

    public double getM4() {
        return m4;
    }

    public void setM4(double m4) {
        this.m4 = m4;
    }

    public double getM5() {
        return m5;
    }

    public void setM5(double m5) {
        this.m5 = m5;
    }

    public double getM6() {
        return m6;
    }

    public void setM6(double m6) {
        this.m6 = m6;
    }

    public double getM7() {
        return m7;
    }

    public void setM7(double m7) {
        this.m7 = m7;
    }

    public double getM8() {
        return m8;
    }

    public void setM8(double m8) {
        this.m8 = m8;
    }

    public double getM9() {
        return m9;
    }

    public void setM9(double m9) {
        this.m9 = m9;
    }

    public double getM10() {
        return m10;
    }

    public void setM10(double m10) {
        this.m10 = m10;
    }

    public double getM11() {
        return m11;
    }

    public void setM11(double m11) {
        this.m11 = m11;
    }

    public double getM12() {
        return m12;
    }

    public void setM12(double m12) {
        this.m12 = m12;
    }

    public double getAnnual_val() {
        return annual_val;
    }

    public void setAnnual_val(double annual_val) {
        this.annual_val = annual_val;
    }

    public double getDjf_winter() {
        return djf_winter;
    }

    public void setDjf_winter(double djf_winter) {
        this.djf_winter = djf_winter;
    }

    public double getMam_spring() {
        return mam_spring;
    }

    public void setMam_spring(double mam_spring) {
        this.mam_spring = mam_spring;
    }

    public double getJja_summer() {
        return jja_summer;
    }

    public void setJja_summer(double jja_summer) {
        this.jja_summer = jja_summer;
    }

    public double getSon_autumn() {
        return son_autumn;
    }

    public void setSon_autumn(double son_autumn) {
        this.son_autumn = son_autumn;
    }

    public int getSt_year() {
        return st_year;
    }

    public void setSt_year(int st_year) {
        this.st_year = st_year;
    }

    public int getEnd_year() {
        return end_year;
    }

    public void setEnd_year(int end_year) {
        this.end_year = end_year;
    }

    public String getVariable_name() {
        return variable_name;
    }

    public void setVariable_name(String variable_name) {
        this.variable_name = variable_name;
    }

    public Point getLoc() {
        return loc;
    }

    public void setLoc(Point loc) {
        this.loc = loc;
    }

   
    
    
    
    

  
    
}
