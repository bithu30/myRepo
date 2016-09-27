/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.references;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 *
 * @author icipmac
 */
@Entity
public class ICIPReport extends ICIPReferenceBase{

    public ICIPReport() {
    }

    public ICIPReport(String authors, String title, Integer year, String Publisher, String PlaceOfPublication) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.PlaceOfPublication = PlaceOfPublication;
        this.Publisher = Publisher;
    }

    public ICIPReport(String authors, String title, Integer year,String weblink, String PlaceOfPublication, String Publisher) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Weblink = weblink;
        this.PlaceOfPublication = PlaceOfPublication;
        this.Publisher = Publisher;
    }
    
    
    
    
    
    @Column(name= "place_of_publication")
    private String PlaceOfPublication;
    @Column(length = 4000, name="publisher")
    private String Publisher;

    public String getPlaceOfPublication() {
        return PlaceOfPublication;
    }

    public void setPlaceOfPublication(String PlaceOfPublication) {
        this.PlaceOfPublication = PlaceOfPublication;
    }

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }
    
    
}
