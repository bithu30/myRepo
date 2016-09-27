/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.repository;

import com.icip.core.user.ICIPUser;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author icipmac
 */
@Repository("climateUserRepository")
public class ClimateUserRepositoryImpl implements ClimateUserRepository {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private ClimateUserJpaRepository climateUserJpaRepository;

    @Override
    public ICIPUser createUser(ICIPUser user) {
        return this.climateUserJpaRepository.saveAndFlush(user);
    }

    @Override
    public ICIPUser findUserByName(String userName) {
        Query query = em.createQuery("select u from ICIPUser u where u.email = :email");
        query.setParameter("email", userName);
        ICIPUser user = (ICIPUser) query.getSingleResult();
        return user;
    }

    @Override
    public void deleteUser(ICIPUser user) {
        this.climateUserJpaRepository.delete(user);
//        Query query = em.createQuery("delete from ICIPUser u where u.email = :email");
//        query.setParameter("email", userName);
//        ICIPUser user = (ICIPUser) query.;
//        return true;
    }

    @Override
    public ICIPUser updateUserPassword(ICIPUser user) {
      //  Query query = em.createQuery("select u from ICIPUser u where u.email = :email");
        //      query.setParameter("email", userName);
        //       ICIPUser user=(ICIPUser)query.getSingleResult();

        //   user.setPassword(newPassword);
        return this.climateUserJpaRepository.save(user);
    }

    @Override
    public ICIPUser findByEmail(String emial) {
        return this.climateUserJpaRepository.findByEmail(emial);
    }

}
