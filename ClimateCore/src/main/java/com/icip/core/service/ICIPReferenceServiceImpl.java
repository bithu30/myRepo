/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.model.ReferenceModel;
import com.icip.core.references.ICIPBook;
import com.icip.core.references.ICIPChapter;
import com.icip.core.references.ICIPJournal;
import com.icip.core.references.ICIPReport;
import com.icip.core.references.ICIPWebpages;
import com.icip.core.repository.ICIPReferenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Service("iCIPReferenceService")
public class ICIPReferenceServiceImpl implements ICIPReferenceService{

    @Autowired
    private ICIPReferenceRepository iCIPReferenceRepository;
    
    @Override
    public ICIPBook findBook(Long id) {
        return this.iCIPReferenceRepository.findBookById(id);
    }

    @Override
    @Transactional
    public ICIPBook createBook(ICIPBook book) {
        return this.iCIPReferenceRepository.createBook(book);
    }

    @Override
    public ICIPChapter findChapter(Long id) {
        return this.iCIPReferenceRepository.findChapterById(id);
    }

    @Override
    @Transactional
    public ICIPChapter createChapter(ICIPChapter chapter) {
        return this.iCIPReferenceRepository.createChapter(chapter);
    }

    @Override
    public ICIPJournal findJournal(Long id) {
        return this.iCIPReferenceRepository.findJournalById(id);
    }

    @Override
    @Transactional
    public ICIPJournal createJournal(ICIPJournal journal) {
        return this.iCIPReferenceRepository.createJournal(journal);
    }

    @Override
    public ICIPReport findReport(Long id) {
        return this.iCIPReferenceRepository.findReportById(id);
    }

    @Override
    @Transactional
    public ICIPReport createReport(ICIPReport report) {
        return this.iCIPReferenceRepository.createReport(report);
    }

    @Override
    public ICIPWebpages findWebpages(Long id) {
       return this.iCIPReferenceRepository.findWebpagesById(id);
    }

    @Override
    @Transactional
    public ICIPWebpages createWebpages(ICIPWebpages webpage) {
        return this.iCIPReferenceRepository.createWebpages(webpage);
    }

    @Override
    @Transactional
    public ICIPBook updateBook(ICIPBook book) {
        return this.iCIPReferenceRepository.updateBook(book);
    }

    @Override
    @Transactional
    public void deleteBook(Long id) {
        this.iCIPReferenceRepository.deleteBook(id);
    }

    @Override
    @Transactional
    public ICIPChapter updateChapter(ICIPChapter chapter) {
         return this.iCIPReferenceRepository.updateChapter(chapter);
    }

    @Override
    @Transactional
    public void deleteChapter(Long id) {
        this.iCIPReferenceRepository.deleteChapter(id);
    }

    @Override
    @Transactional
    public ICIPJournal updateJournal(ICIPJournal journal) {
        return this.iCIPReferenceRepository.updateJournal(journal);
    }

    @Override
    @Transactional
    public void deleteJournal(Long id) {
        this.iCIPReferenceRepository.deleteJournal(id);
    }

    @Override
    @Transactional
    public ICIPReport updateReport(ICIPReport report) {
        return this.iCIPReferenceRepository.updateReport(report);
    }

    @Override
    @Transactional
    public void deleteReport(Long id) {
        this.iCIPReferenceRepository.deleteReport(id);
    }

    @Override
    @Transactional
    public ICIPWebpages updateWebpages(ICIPWebpages webpage) {
        return this.iCIPReferenceRepository.updateWebpages(webpage);
    }

    @Override
    @Transactional
    public void deleteWebpages(Long id) {
        this.iCIPReferenceRepository.deleteWebpages(id);
    }

    @Override
    public ReferenceModel FindAllReferences() {
        return this.iCIPReferenceRepository.FindAllReferences();
    }
    
}
