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
public class ICIPBook extends ICIPReferenceBase{

    public ICIPBook() {
    }
    
    public ICIPBook(String authors, String title, Integer year, String publisher)
    {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Publisher = publisher;
    }

    public ICIPBook(String authors, String title, Integer year, String weblink, String Publisher, String PlaceOfPublication, String Pages) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Weblink = weblink;
        this.Publisher = Publisher;
        this.PlaceOfPublication = PlaceOfPublication;
        this.Pages = Pages;
    }
    
    

    @Column(length = 4000, name= "Publisher")
    private String Publisher;
    
    @Column(name= "place_of_publication")
    private String PlaceOfPublication;
    
    @Column(name = "pages")
    private String Pages;

    public String getPlaceOfPublication() {
        return PlaceOfPublication;
    }

    public void setPlaceOfPublication(String PlaceOfPublication) {
        this.PlaceOfPublication = PlaceOfPublication;
    }

    public String getPages() {
        return Pages;
    }

    public void setPages(String Pages) {
        this.Pages = Pages;
    }
    
    
    
    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }
    
    
    
    
}
