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
public class ICIPJournal extends ICIPReferenceBase{

    public ICIPJournal() {
    }

    public ICIPJournal(String authors, String title, Integer year,String Publisher, String JournalNo, String Pages) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;     
        this.Publisher = Publisher;
        this.JournalNo = JournalNo;
        this.Pages = Pages;
    }

    public ICIPJournal(String authors, String title, Integer year,String weblink, String Publisher, String JournalNo, String Pages) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year; 
        this.Weblink = weblink;
        this.Publisher = Publisher;
        this.JournalNo = JournalNo;
        this.Pages = Pages;
    }
    
    
       
    @Column(length = 4000, name ="publisher")
    private String Publisher;
    @Column(name = "journal_no")
    private String JournalNo;
    @Column(name = "pages")
    private String Pages;

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }

    public String getJournalNo() {
        return JournalNo;
    }

    public void setJournalNo(String JournalNo) {
        this.JournalNo = JournalNo;
    }

    public String getPages() {
        return Pages;
    }

    public void setPages(String Pages) {
        this.Pages = Pages;
    }
    
    
}
