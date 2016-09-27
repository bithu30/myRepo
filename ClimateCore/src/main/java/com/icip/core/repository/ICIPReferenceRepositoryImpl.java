/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.model.ReferenceModel;
import com.icip.core.references.ICIPBook;
import com.icip.core.references.ICIPChapter;
import com.icip.core.references.ICIPJournal;
import com.icip.core.references.ICIPReport;
import com.icip.core.references.ICIPWebpages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("iCIPReferenceRepository")
public class ICIPReferenceRepositoryImpl implements ICIPReferenceRepository{

    @Autowired
    private ICIPBookJpaRepository iCIPBookJpaRepository;
    @Autowired 
    private ICIPChapterJpaRepository iCIPChapterJpaRepository;
    @Autowired
    private ICIPJournalJpaRepository iCIPJournalJpaRepository;
    @Autowired
    private ICIPReportJpaRepository iCIPReportJpaRepository;
    @Autowired
    private ICIPWebpagesJpaRepository iCIPWebpagesJpaRepository;
    
    @Override
    public ICIPBook findBookById(Long id) {
        return this.iCIPBookJpaRepository.findOne(id);
    }

    @Override
    public ICIPBook createBook(ICIPBook book) {
        return this.iCIPBookJpaRepository.saveAndFlush(book);
    }

    @Override
    public ICIPChapter findChapterById(Long id) {
        return this.iCIPChapterJpaRepository.findOne(id);
    }

    @Override
    public ICIPChapter createChapter(ICIPChapter chapter) {
        return this.iCIPChapterJpaRepository.saveAndFlush(chapter);
    }

    @Override
    public ICIPJournal findJournalById(Long id) {
        return this.iCIPJournalJpaRepository.findOne(id);
    }

    @Override
    public ICIPJournal createJournal(ICIPJournal journal) {
         return this.iCIPJournalJpaRepository.saveAndFlush(journal);
    }

    @Override
    public ICIPReport findReportById(Long id) {
        return this.iCIPReportJpaRepository.findOne(id);
    }

    @Override
    public ICIPReport createReport(ICIPReport report) {
        return this.iCIPReportJpaRepository.saveAndFlush(report);
    }

    @Override
    public ICIPWebpages findWebpagesById(Long id) {
        return this.iCIPWebpagesJpaRepository.findOne(id);
    }

    @Override
    public ICIPWebpages createWebpages(ICIPWebpages webpage) {
       return this.iCIPWebpagesJpaRepository.saveAndFlush(webpage);
    }

    @Override
    public ICIPBook updateBook(ICIPBook book) {
        ICIPBook b = this.iCIPBookJpaRepository.findOne(book.getId());
        
        b.setAuthors(book.getAuthors());
        b.setTitle(book.getTitle());
        b.setYear(book.getYear());
        b.setPublisher(book.getPublisher());
        
        b.setPages(book.getPages());
        b.setPlaceOfPublication(book.getPlaceOfPublication());
        b.setWeblink(book.getWeblink());
        
        return this.iCIPBookJpaRepository.save(b);
    }

    @Override
    public void deleteBook(Long id) {
        ICIPBook b = this.iCIPBookJpaRepository.findOne(id);
        this.iCIPBookJpaRepository.delete(b);
    }

    @Override
    public ICIPChapter updateChapter(ICIPChapter chapter) {
        ICIPChapter c = this.iCIPChapterJpaRepository.findOne(chapter.getId());
        
        c.setAuthors(chapter.getAuthors());
        c.setTitle(chapter.getTitle());
        c.setYear(chapter.getYear());
        c.setPublisher(chapter.getPublisher());
        c.setChapterTitle(chapter.getChapterTitle());
        c.setPages(chapter.getPages());
        
        c.setEditors(chapter.getEditors());
        c.setPlaceOfPublication(chapter.getPlaceOfPublication());
        c.setWeblink(chapter.getWeblink());
        
        return this.iCIPChapterJpaRepository.save(c);
    }

    @Override
    public void deleteChapter(Long id) {
       ICIPChapter c = this.iCIPChapterJpaRepository.findOne(id);
       this.iCIPChapterJpaRepository.delete(c);
    }

    @Override
    public ICIPJournal updateJournal(ICIPJournal journal) {
        ICIPJournal j = this.iCIPJournalJpaRepository.findOne(journal.getId());
        
        j.setAuthors(journal.getAuthors());
        j.setTitle(journal.getTitle());
        j.setYear(journal.getYear());
        j.setPublisher(journal.getPublisher());
        j.setJournalNo(journal.getJournalNo());
        j.setPages(journal.getPages());
        
        j.setWeblink(journal.getWeblink());
        
        return this.iCIPJournalJpaRepository.save(j);
    }

    @Override
    public void deleteJournal(Long id) {
        ICIPJournal j = this.iCIPJournalJpaRepository.findOne(id);
        this.iCIPJournalJpaRepository.delete(j);
    }

    @Override
    public ICIPReport updateReport(ICIPReport report) {
         ICIPReport r = this.iCIPReportJpaRepository.findOne(report.getId());
        
        r.setAuthors(report.getAuthors());
        r.setTitle(report.getTitle());
        r.setYear(report.getYear());
        r.setPublisher(report.getPublisher());
        r.setPlaceOfPublication(report.getPlaceOfPublication());
        
        r.setWeblink(report.getWeblink());
        
        return this.iCIPReportJpaRepository.save(r);
    }

    @Override
    public void deleteReport(Long id) {
       ICIPReport r = this.iCIPReportJpaRepository.findOne(id);
       this.iCIPReportJpaRepository.delete(r);
    }

    @Override
    public ICIPWebpages updateWebpages(ICIPWebpages webpage) {
        ICIPWebpages wp = this.iCIPWebpagesJpaRepository.findOne(webpage.getId());
        
        wp.setAuthors(webpage.getAuthors());
        wp.setTitle(webpage.getTitle());
        wp.setYear(webpage.getYear());
        wp.setUrl(webpage.getUrl());
        wp.setAccessDate(webpage.getAccessDate());
        
        wp.setWeblink(webpage.getUrl());
        
        return this.iCIPWebpagesJpaRepository.save(wp);
    }

    @Override
    public void deleteWebpages(Long id) {
        ICIPWebpages wp = this.iCIPWebpagesJpaRepository.findOne(id);
        this.iCIPWebpagesJpaRepository.delete(wp);
    }

    @Override
    public ReferenceModel FindAllReferences() {
        ReferenceModel rm = new ReferenceModel();
        
        rm.setBooks(this.iCIPBookJpaRepository.findAll());
        rm.setChapters(this.iCIPChapterJpaRepository.findAll());
        rm.setJournals(this.iCIPJournalJpaRepository.findAll());
        rm.setReports(this.iCIPReportJpaRepository.findAll());
        rm.setWebpages(this.iCIPWebpagesJpaRepository.findAll());
        

        return rm;
    }
    
}
