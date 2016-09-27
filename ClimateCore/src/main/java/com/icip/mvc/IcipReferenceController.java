/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.mvc;

import com.icip.core.ENUMS.ReferenceType;
import com.icip.core.model.ReferenceModel;
import com.icip.core.references.ICIPBook;
import com.icip.core.references.ICIPChapter;
import com.icip.core.references.ICIPJournal;
import com.icip.core.references.ICIPReferenceBase;
import com.icip.core.references.ICIPReport;
import com.icip.core.references.ICIPWebpages;
import com.icip.core.service.ICIPReferenceService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author icipmac
 */
@RestController
@RequestMapping("/icipref")
public class IcipReferenceController {
    
    // place for service
    @Autowired
    private ICIPReferenceService iCIPReferenceService;
    
    @RequestMapping(value="/getrefmodel", method = RequestMethod.GET)
    public @ResponseBody ReferenceModel getrefmodel(HttpServletRequest request, HttpServletResponse response)
    {
        ReferenceModel m = this.iCIPReferenceService.FindAllReferences();
        if(m != null)
        {
            return m;
        }
        
        return null;
    }
    
    @RequestMapping(value="/getreference", method = RequestMethod.GET)
    public ResponseEntity<?> getreference(HttpServletRequest request, HttpServletResponse response)
    {
        ICIPReferenceBase result = null;
        
        Long id = 0L;
        try{
        id = Long.parseLong(request.getParameter("id"));
        }
        catch(NumberFormatException nfe)
        {
          //  return result;
            return new ResponseEntity<String>("Provided Id is not valid", HttpStatus.BAD_REQUEST);
        }
       ReferenceType ref = ReferenceType.valueOf(request.getParameter("ref"));

       // ICIPBook b = this.iCIPReferenceService.findBook(5L);
         switch (ref) {
            case book:
             
                result = this.iCIPReferenceService.findBook(id);
                
                     break;
            case chapter:
             
                result = this.iCIPReferenceService.findChapter(id);
                
                     break;
            case journal:
              
                result = this.iCIPReferenceService.findJournal(id);
                
                     break;
            case report:
                             
                result = this.iCIPReferenceService.findReport(id);
                
                     break;
            case webpage:
                           
                result = this.iCIPReferenceService.findWebpages(id);
                
                     break;
            default:
                break;
        }
        
        if(result != null)
        {
            return new ResponseEntity<ICIPReferenceBase>(result,HttpStatus.OK);
        }
        else
        {
            return new ResponseEntity<String>("Reference wasn't found", HttpStatus.BAD_REQUEST);
        }
    }
    
    
    @RequestMapping(value="/createreference", method = RequestMethod.POST)
    public ResponseEntity<?> createreference(HttpServletRequest request, HttpServletResponse response) 
    {
        ICIPReferenceBase result = null;
        int ref = Integer.parseInt(request.getParameter("ref"));
        //String id = request.getParameter("Id");
        String authors = request.getParameter("Authors");
        String title = request.getParameter("Title");
        String weblink = request.getParameter("webLink");
        
        int year = 0;
        try{
        year = Integer.parseInt(request.getParameter("Year"));
        }
        catch(NumberFormatException nfe)
        {
            return new ResponseEntity<String>("Year has to be a number", HttpStatus.BAD_REQUEST);
        }
        switch (ref) {
            case 1:
                String bpub = request.getParameter("bookPublisher");
                String bpop = request.getParameter("bookPlaceOfPublication");        
                
                String bpages = request.getParameter("bookPages");
                
                result = this.iCIPReferenceService.createBook(new ICIPBook(authors, title, year, weblink, bpub, bpop, bpages));
                
                     break;
            case 2:
                String cpub = request.getParameter("chapterPublisher");
                String ctitle = request.getParameter("chapterTitle");
                String cpages = request.getParameter("chapterPages");
                String cpop = request.getParameter("chapterPlaceOfPublication");        
                
                String ceditors = request.getParameter("chapterEditors");
                
                result = this.iCIPReferenceService.createChapter(new ICIPChapter(authors, title, year,weblink, cpub, ctitle, cpages, cpop, ceditors));
                
                     break;
            case 3:
                String jpub = request.getParameter("journalPublisher");
                String jnumber = request.getParameter("journalNumber");
                String jpages = request.getParameter("journalPages");
                
                result = this.iCIPReferenceService.createJournal(new ICIPJournal(authors, title, year,weblink, jpub, jnumber, jpages));
                
                     break;
            case 4:
                String rpub = request.getParameter("reportPublisher");
                String pop = request.getParameter("reportPlaceOfPublication");
                
                result = this.iCIPReferenceService.createReport(new ICIPReport(authors, title, year,weblink,  pop, rpub));
                
                     break;
            case 5:
                String wlink = request.getParameter("webpageLink");
                String accessDate = request.getParameter("webpageAccessDate");
                
                result = this.iCIPReferenceService.createWebpages(new ICIPWebpages(authors, title, year ,weblink, accessDate));
                
                     break;
            default:
                break;
        }
        
        if(result != null){ return new ResponseEntity<ICIPReferenceBase>(result,HttpStatus.OK);}
        else{ return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);}
    }
    
    @RequestMapping(value="/updatereference", method = RequestMethod.POST)
    public ResponseEntity<?> updatereference(HttpServletRequest request, HttpServletResponse response)
    {
        //@ResponseBody ICIPReferenceBase
        
        ICIPReferenceBase result = null;
        int ref = Integer.parseInt(request.getParameter("ref"));
        Long id = Long.parseLong(request.getParameter("id"));
        String authors = request.getParameter("Authors");
        String title = request.getParameter("Title");
        String weblink = request.getParameter("webLink");
        //int year = Integer.parseInt(request.getParameter("Year"));
        
        int year = 0;
        try{
        year = Integer.parseInt(request.getParameter("Year"));
        }
        catch(NumberFormatException nfe)
        {
          //  return result;
            return new ResponseEntity<String>("Year has to be a number", HttpStatus.BAD_REQUEST);
        }
        
        switch (ref) {
            case 1:
                String bpub = request.getParameter("bookPublisher");
                String bpop = request.getParameter("bookPlaceOfPublication");        
                
                String bpages = request.getParameter("bookPages");
                ICIPBook b = new ICIPBook(authors, title, year, weblink, bpub, bpop, bpages);
                b.setId(id);
                result = this.iCIPReferenceService.updateBook(b);
                
                     break;
            case 2:
                String cpub = request.getParameter("chapterPublisher");
                String ctitle = request.getParameter("chapterTitle");
                String cpages = request.getParameter("chapterPages");
                String cpop = request.getParameter("chapterPlaceOfPublication");        
                
                String ceditors = request.getParameter("chapterEditors");
                ICIPChapter c = new ICIPChapter(authors, title, year,weblink, cpub, ctitle, cpages, cpop, ceditors);
                c.setId(id);
                result = this.iCIPReferenceService.updateChapter(c);
                
                     break;
            case 3:
                String jpub = request.getParameter("journalPublisher");
                String jnumber = request.getParameter("journalNumber");
                String jpages = request.getParameter("journalPages");
                ICIPJournal j = new ICIPJournal(authors, title, year,weblink, jpub, jnumber, jpages);
                j.setId(id);
                result = this.iCIPReferenceService.updateJournal(j);
                
                     break;
            case 4:
                String rpub = request.getParameter("reportPublisher");
                String pop = request.getParameter("reportPlaceOfPublication");                
                ICIPReport r = new ICIPReport(authors, title, year,weblink,pop, rpub);
                r.setId(id);               
                result = this.iCIPReferenceService.updateReport(r);
                
                     break;
            case 5:
               
                String accessDate = request.getParameter("webpageAccessDate");
                ICIPWebpages w = new ICIPWebpages(authors, title, year, weblink, accessDate);
                w.setId(id);               
                result = this.iCIPReferenceService.updateWebpages(w);
                
                     break;
            default:
                break;
        }
        
        if(result != null){ return new ResponseEntity<ICIPReferenceBase>(result,HttpStatus.OK);}
        else{ return new ResponseEntity<String>("BAD", HttpStatus.BAD_REQUEST);}
        
       // return result;
        
    }
    
    @RequestMapping(value="/deletereference", method = RequestMethod.POST)
    public ResponseEntity<?> deletereference(HttpServletRequest request, HttpServletResponse response)
    {
    
        Long id = 0L;
        try{
        id = Long.parseLong(request.getParameter("id"));
        }
        catch(NumberFormatException nfe)
        {
          //  return result;
            return new ResponseEntity<String>("Nothing was selected", HttpStatus.BAD_REQUEST);
        }
        
        switch (Integer.parseInt(request.getParameter("ref"))) {
            case 1:              
                this.iCIPReferenceService.deleteBook(id);               
                     break;
            case 2:
                 
                this.iCIPReferenceService.deleteChapter(id);   
                     break;
            case 3:
               this.iCIPReferenceService.deleteJournal(id);   
                
                     break;
            case 4:
              this.iCIPReferenceService.deleteReport(id);   
                
                     break;
            case 5:
                this.iCIPReferenceService.deleteWebpages(id);   
                     break;
            default:
                break;
        }
        
        return  new ResponseEntity<String>("OK",HttpStatus.OK);
    }
    
    
    
}
