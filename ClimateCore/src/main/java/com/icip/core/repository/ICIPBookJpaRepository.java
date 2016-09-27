/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.references.ICIPBook;
import org.springframework.stereotype.Repository;

/**
 *
 * @author icipmac
 */
@Repository("iCIPBookJpaRepository")
public interface ICIPBookJpaRepository extends ICIPReferenceBaseRepository<ICIPBook>{
    
}
