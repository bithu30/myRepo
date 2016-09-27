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
public class ICIPChapter extends ICIPReferenceBase{

    public ICIPChapter() {
    }

    public ICIPChapter(String authors, String title, Integer year, String Publisher, String ChapterTitle, String Pages) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Publisher = Publisher;
        this.ChapterTitle = ChapterTitle;
        this.Pages = Pages;
    }    

    public ICIPChapter(String authors, String title, Integer year, String weblink, String Publisher, String ChapterTitle, String Pages, String PlaceOfPublication, String Editors) {
        this.Authors = authors;
        this.Title = title;
        this.Year = year;
        this.Weblink = weblink;
        this.Publisher = Publisher;
        this.ChapterTitle = ChapterTitle;
        this.Pages = Pages;
        this.PlaceOfPublication = PlaceOfPublication;
        this.Editors = Editors;
    }
    
    
    
    @Column(length = 4000, name ="publisher")
    private String Publisher;
    @Column(name = "chapter_title")
    private String ChapterTitle;
    @Column(name = "pages")
    private String Pages;
    @Column(name= "place_of_publication")
    private String PlaceOfPublication;
    @Column(name = "editors")
    private String Editors;

    public String getPlaceOfPublication() {
        return PlaceOfPublication;
    }

    public void setPlaceOfPublication(String PlaceOfPublication) {
        this.PlaceOfPublication = PlaceOfPublication;
    }

    public String getEditors() {
        return Editors;
    }

    public void setEditors(String Editors) {
        this.Editors = Editors;
    }
    
    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }

    public String getChapterTitle() {
        return ChapterTitle;
    }

    public void setChapterTitle(String ChapterTitle) {
        this.ChapterTitle = ChapterTitle;
    }

    public String getPages() {
        return Pages;
    }

    public void setPages(String Pages) {
        this.Pages = Pages;
    }
       
}
