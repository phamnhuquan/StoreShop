/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ImageEntity;
import com.mycompany.spring_project_final.repositories.ImageRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
    
    @Autowired
    private ImageRepository imageRepository;
    
    public  List<ImageEntity> getListImage(){
        return (List<ImageEntity>) imageRepository.findAll();
    }
    
    public List<ImageEntity> getImageByProductId( int productId){
         
        List<ImageEntity> listImage = getListImage();
        List<ImageEntity> listImageByProductId = new ArrayList<>();
        if(listImage == null){
            return null;
        }else{
            for( int i = 0 ; i < listImage.size() ; i++){
                if( listImage.get(i).getProduct().getId() == productId ){
                    listImageByProductId.add(listImage.get(i));
                }
            }
            return listImageByProductId;
        }         
    }
}
