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

/**
 *
 * @author icipmac
 */
public interface ICIPReferenceRepository {
    ICIPBook findBookById(Long id);
    ICIPBook createBook(ICIPBook book);
    ICIPBook updateBook(ICIPBook book);
    void deleteBook(Long id);
    
    ICIPChapter findChapterById(Long id);
    ICIPChapter createChapter(ICIPChapter chapter);
    ICIPChapter updateChapter(ICIPChapter chapter);
    void deleteChapter(Long id);
    
    ICIPJournal findJournalById(Long id);
    ICIPJournal createJournal(ICIPJournal journal);
    ICIPJournal updateJournal(ICIPJournal journal);
    void deleteJournal(Long id);
    
    ICIPReport findReportById(Long id);
    ICIPReport createReport(ICIPReport report);
    ICIPReport updateReport(ICIPReport report);
    void deleteReport(Long id);
    
    ICIPWebpages findWebpagesById(Long id);
    ICIPWebpages createWebpages(ICIPWebpages webpage);
    ICIPWebpages updateWebpages(ICIPWebpages webpage);
    void deleteWebpages(Long id);
    
    ReferenceModel FindAllReferences();
}
