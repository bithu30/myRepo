/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.model;

import com.icip.core.references.ICIPBook;
import com.icip.core.references.ICIPChapter;
import com.icip.core.references.ICIPJournal;
import com.icip.core.references.ICIPReport;
import com.icip.core.references.ICIPWebpages;
import java.util.List;

/**
 *
 * @author icipmac
 */
public class ReferenceModel {
    
    
    private List<ICIPBook> books;
    private List<ICIPJournal> journals;
    private List<ICIPChapter> chapters;
    private List<ICIPReport> reports;
    private List<ICIPWebpages> webpages;
    
    

    public List<ICIPBook> getBooks() {
        return books;
    }

    public void setBooks(List<ICIPBook> books) {
        this.books = books;
    }

    public List<ICIPJournal> getJournals() {
        return journals;
    }

    public void setJournals(List<ICIPJournal> journals) {
        this.journals = journals;
    }

    public List<ICIPChapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<ICIPChapter> chapters) {
        this.chapters = chapters;
    }

    public List<ICIPReport> getReports() {
        return reports;
    }

    public void setReports(List<ICIPReport> reports) {
        this.reports = reports;
    }

    public List<ICIPWebpages> getWebpages() {
        return webpages;
    }

    public void setWebpages(List<ICIPWebpages> webpages) {
        this.webpages = webpages;
    }
    
    
    
}
