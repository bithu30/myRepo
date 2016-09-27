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
public class ICIPWebpages extends ICIPReferenceBase {

    public ICIPWebpages() {
    }

    public ICIPWebpages(String authors, String title, Integer year, String Url, String AccessDate) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Weblink = Url;
        this.Url = Url;
        this.AccessDate = AccessDate;
    }
    
    
    
    @Column(name= "url_address")
    private String Url;

    @Column(name = "access_date")
    private String AccessDate;
    
     public String getUrl() {
        return Url;
    }

    public void setUrl(String Url) {
       this.Url = Url;
    }

    public String getAccessDate() {
        return AccessDate;
    }

    public void setAccessDate(String AccessDate) {
        this.AccessDate = AccessDate;
    }
    
}
