/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.SizeEntity;
import com.mycompany.spring_project_final.repositories.SizeRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SizeService {
    
    @Autowired
    private SizeRepository sizeRepository;
    
    public List<SizeEntity> getSizes(){
        return (List<SizeEntity>) sizeRepository.findAll();
    }
    
    public SizeEntity getSize(int id){
        return sizeRepository.findOne(id);
    }
}
