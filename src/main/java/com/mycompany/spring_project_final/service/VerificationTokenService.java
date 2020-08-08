/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.VerificationToken;
import com.mycompany.spring_project_final.repositories.VerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VerificationTokenService {
    
    @Autowired
    private VerificationTokenRepository verificationTokenRepository;
    
    public void save(VerificationToken verificationToken) {
        verificationTokenRepository.save(verificationToken);
    }
    public VerificationToken findByToken(String token){
        return verificationTokenRepository.findByToken(token);
    }
}
