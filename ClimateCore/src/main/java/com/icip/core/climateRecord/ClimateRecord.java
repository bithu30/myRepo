/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.climateRecord;

import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.Point;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;

/**
 *
 * @author icipmac
 */
@Entity
@Table(name="climatedata")
@SequenceGenerator(name="climatedata_SEQ", sequenceName="climatedata_seq", initialValue=1, allocationSize=1)
public class ClimateRecord implements Serializable
{
    //private static final long serialVersionUID = 5719888132668143563L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="climatedata_SEQ")
    private long cdID;

    @Column(name = "modelNameG", nullable = false, length = 20)
    private String modelNameG;

    @Column(name = "modelNameR", nullable = false, length = 20)
    private String modelNameR;

    @Column(name = "scenario", nullable = false, length = 10)
    private String scenario;

    @Column(name = "resolution", nullable = false, length = 10)
    private String resolution;

    @Column(name = "start_yr", nullable = false, length = 4)
    private int start_yr;

    @Column(name = "end_yr", nullable = false, length = 4)
    private int end_yr;

    @Column(name = "months", nullable = false, length = 3)
    private String months;

    @Column(name = "lon", nullable = false)
    private double lon;

    @Column(name = "lat", nullable = false)
    private double lat;

    @Column(name = "variable_name", nullable = false, length = 30)
    private String variable_name;

    @Column(name = "min_val", nullable = false)
    private double min_val;

    @Column(name = "mean_val", nullable = false)
    private double mean_val;

    @Column(name = "max_val", nullable = false)
    private double max_val;

  //  @Column(name="LOC")
 //@Type(type="org.hibernatespatial.GeometryUserType")
    //@Type(type="org.hibernate.spatial.GeometryType")
    @Column(name="LOC",columnDefinition="GEOMETRY", nullable = false)
    @Type(type="org.hibernate.spatial.GeometryType")
    @Transient
    private Point LOC=null;

    public ClimateRecord()
    {
    }

    public ClimateRecord(String modelNameG, String modelNameR, String scenario, String resolution, int start_yr, int end_yr, String months, double lon,
                         double lat, String variable_name, double min_val, double mean_val, double max_val)
    {
        this.modelNameG = modelNameG;
        this.modelNameR = modelNameR;
        this.scenario = scenario;
        this.resolution=resolution;
        this.start_yr = start_yr;
        this.end_yr = end_yr;
        this.months = months;
        this.lon = lon;
        this.lat = lat;
        this.variable_name = variable_name;
        this.min_val = min_val;
        this.mean_val = mean_val;
        this.max_val = max_val;

        GeometryFactory gf = new GeometryFactory();
        //Coordinate coord = new Coordinate(this.lat, this.lon); // reversed lon lat
        Coordinate coord = new Coordinate(this.lon, this.lat);
        this.LOC = gf.createPoint(coord);
    }

    public String getModelNameR() {
        return modelNameR;
    }

    public void setModelNameR(String modelNameR) {
        this.modelNameR = modelNameR;
    }

    public String getModelNameG() {
        return modelNameG;
    }

    public void setModelNameG(String modelName) {
        this.modelNameG = modelName;
    }

    public String getScenario() {
        return scenario;
    }

    public void setScenario(String scenario) {
        this.scenario = scenario;
    }

    public int getStart_yr() {
        return start_yr;
    }

    public void setStart_yr(int start_yr) {
        this.start_yr = start_yr;
    }

    public int getEnd_yr() {
        return end_yr;
    }

    public void setEnd_yr(int end_yr) {
        this.end_yr = end_yr;
    }

    public String getMonths() {
        return months;
    }

    public void setMonths(String months) {
        this.months = months;
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

    public String getVariable_name() {
        return variable_name;
    }

    public void setVariable_name(String variable_name) {
        this.variable_name = variable_name;
    }

    public double getMin_val() {
        return min_val;
    }

    public void setMin_val(double min_val) {
        this.min_val = min_val;
    }

    public double getMean_val() {
        return mean_val;
    }

    public void setMean_val(double mean_val) {
        this.mean_val = mean_val;
    }

    public double getMax_val() {
        return max_val;
    }

    public void setMax_val(double max_val) {
        this.max_val = max_val;
    }

 //@Column(name="LOC")
 //@Type(type="org.hibernatespatial.GeometryUserType")
   public Point getLOC() {
        
       return LOC;
    }

    public void setLOC(Point geom) {
       this.LOC = geom;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }
}
