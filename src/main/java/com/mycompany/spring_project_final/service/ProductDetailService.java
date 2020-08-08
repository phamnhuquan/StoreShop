/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_project_final.repositories.ProductDetailRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDetailService {

    @Autowired
    private ProductDetailRepository productDetailRepository;

    public List<ProductDetailEntity> getProductDetails() {
        return (List<ProductDetailEntity>) productDetailRepository.findAll();
    }
    
    public List<ProductDetailEntity> getColorByProductId(int productId) {
        List<ProductDetailEntity> listColor = getProductDetails();
        List<ProductDetailEntity> listColorByProductId = new ArrayList<>();
        if (listColor == null) {
            return null;
        } else {
            for (int i = 0; i < listColor.size(); i++) {
                if (listColor.get(i).getProduct().getId() == productId) {
                    listColorByProductId.add(listColor.get(i));
                    
                }
            }
            for(int i = 0; i < listColorByProductId.size(); i++){
                for(int j = i + 1; j < listColorByProductId.size(); j++){
                    if(listColorByProductId.get(i).getColor().getId() == listColorByProductId.get(j).getColor().getId() ){
                        listColorByProductId.remove(j);
                        j--;
                    }
                }
            }
        }
        return listColorByProductId;
    }
    
    
    
    
    public List<ProductDetailEntity> getSizeByProductId(int productId) {
        List<ProductDetailEntity> listSize = getProductDetails();
        List<ProductDetailEntity> listSizeByProductId = new ArrayList<>();
        if (listSize == null) {
            return null;
        } else {
            for (int i = 0; i < listSize.size(); i++) {
                if (listSize.get(i).getProduct().getId() == productId ) {
                    listSizeByProductId.add(listSize.get(i));
                }
            }
            for(int i = 0; i < listSizeByProductId.size(); i++){
                for(int j = i + 1; j < listSizeByProductId.size(); j++){
                    if(listSizeByProductId.get(i).getSize().getId() == listSizeByProductId.get(j).getSize().getId() ){
                        listSizeByProductId.remove(j);
                        j--;
                    }
                }
            }
        }
        return listSizeByProductId;
    }
    
    
}
