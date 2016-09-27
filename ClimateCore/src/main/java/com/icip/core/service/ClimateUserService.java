/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.core.service;

import com.icip.core.user.ICIPUser;

/**
 *
 * @author icipmac
 */
public interface ClimateUserService {
    ICIPUser createUser(ICIPUser user);
    ICIPUser findUserByName(String userName);
    ICIPUser updateUserPassword(ICIPUser user);
    ICIPUser findByEmail(String email);
    public void deleteUser(ICIPUser user);
}
