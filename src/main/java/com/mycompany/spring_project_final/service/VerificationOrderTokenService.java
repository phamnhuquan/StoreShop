/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.VerificationOrderToken;
import com.mycompany.spring_project_final.repositories.VerificationOrderTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VerificationOrderTokenService {
    @Autowired
    private VerificationOrderTokenRepository verificationOrderTokenRepository;
    
    public void save(VerificationOrderToken verificationToken) {
        verificationOrderTokenRepository.save(verificationToken);
    }
    public VerificationOrderToken findByToken(String token){
        return verificationOrderTokenRepository.findByToken(token);
    }
    public VerificationOrderToken findTokenByOrder(int orderId){
        return verificationOrderTokenRepository.findTokenByOrder(orderId);
    }
    public boolean delete(int id){        
        verificationOrderTokenRepository.delete(id);
        return verificationOrderTokenRepository.exists(id);
    } 
}
