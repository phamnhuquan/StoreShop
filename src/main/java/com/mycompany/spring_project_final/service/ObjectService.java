/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ObjectEntity;
import com.mycompany.spring_project_final.repositories.ObjectRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ObjectService {
    @Autowired
    private ObjectRepository objectRepository;
    
    public List<ObjectEntity> getObjects(){
        return (List<ObjectEntity>) objectRepository.findAll();
    }
}
