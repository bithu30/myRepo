/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.references;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 *
 * @author icipmac
 */
@MappedSuperclass
public class ICIPReferenceBase {
    
    @Id
    @GeneratedValue
    private Long Id;
    
    @Column(length=4000)
    protected String Authors;
    
    @Column(length = 4000)
    protected String Title;
    
    @Column(name = "Publish_year")
    protected Integer Year;
    
    @Column(name = "web_link")
    protected String Weblink;

    public String getWeblink() {
        return Weblink;
    }

    public void setWeblink(String Weblink) {
        this.Weblink = Weblink;
    }
     
    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public String getAuthors() {
        return Authors;
    }

    public void setAuthors(String Authors) {
        this.Authors = Authors;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public Integer getYear() {
        return Year;
    }

    public void setYear(Integer Year) {
        this.Year = Year;
    }
    
}
