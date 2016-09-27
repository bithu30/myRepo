/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.icipcsv.ClimateCSVRecord;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("climateCsvRepository")
public class ClimateCsvRepositoryImpl implements ClimateCsvRepository{
    
    @PersistenceContext
    private EntityManager em;
    
    @Autowired
    private ClimateCsvJpaRepository climateCsvJpaRepository;

    @Override
    public List<ClimateCSVRecord> getCSVrecords(String start_yr, String end_yr, String var, String whatTimeSpan) {
        
        //String qs = "select ";
        //TYped query
        String qs = "select NEW com.icip.core.DTOS.CsvDto(";
        
        // biuld proper query string 
        if(whatTimeSpan.equals("year")){qs += "r.annual_val";}
        else if(whatTimeSpan.equals("winter")){qs += "r.djf_winter";}
        else if(whatTimeSpan.equals("spring")){qs += "r.mam_spring";}
        else if(whatTimeSpan.equals("summer")){qs += "r.jja_summer";}
        else if(whatTimeSpan.equals("autumn")){qs += "r.son_autumn";}
        else if(whatTimeSpan.equals("m1")){qs += "r.m1";}
        else if(whatTimeSpan.equals("m2")){qs += "r.m2";}
        else if(whatTimeSpan.equals("m3")){qs += "r.m3";}
        else if(whatTimeSpan.equals("m4")){qs += "r.m4";}
        else if(whatTimeSpan.equals("m5")){qs += "r.m5";}
        else if(whatTimeSpan.equals("m6")){qs += "r.m6";}
        else if(whatTimeSpan.equals("m7")){qs += "r.m7";}
        else if(whatTimeSpan.equals("m8")){qs += "r.m8";}
        else if(whatTimeSpan.equals("m9")){qs += "r.m9";}
        else if(whatTimeSpan.equals("m10")){qs += "r.m10";}
        else if(whatTimeSpan.equals("m11")){qs += "r.m11";}
        else if(whatTimeSpan.equals("m12")){qs += "r.m12";}
        
        qs += ", r.lon, r.lat) from ClimateCSVRecord r where "                    
           + "r.variable_name = :varP "
           + "and r.st_year= :start_yr "
           + "and r.end_year = :end_yr";
        
        Query q = em.createQuery(qs);
        
        int startY = Integer.parseInt(start_yr);
        int endY = Integer.parseInt(end_yr);
        
        q.setParameter("varP", var);
        q.setParameter("start_yr", startY);
        q.setParameter("end_yr", endY);
        
        
        List<ClimateCSVRecord> res = q.getResultList();
        return res;
        
    }
    
    
    
    
}
