/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.ProductEntity;
import com.mycompany.spring_project_final.repositories.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    
    @Autowired
    private ProductRepository productRepository;
    
    public List<ProductEntity> getProducts(){
        return (List<ProductEntity>) productRepository.findAllProduct();
    }
    public ProductEntity findProductById(int id){
        return productRepository.findOne(id);
    }
    public void save(ProductEntity productEntity){
        productRepository.save(productEntity);
    }
    public List<ProductEntity> searchProduct(String strCategory, String strProductName, String objectName){
        return (List<ProductEntity>) productRepository.findProductByCategoryNameOrProductNameOrObjectName(strCategory, strProductName, objectName);
    }
    public List<ProductEntity> getProductsByObjectMen(){
        return (List<ProductEntity>) productRepository.findProductByObjectMen();
    }
    public List<ProductEntity> getProductsByObjectWomen(){
        return (List<ProductEntity>) productRepository.findProductByObjectWomen();
    }
    public List<ProductEntity> getNewProducts(){
        return (List<ProductEntity>) productRepository.findNewProduct();
    }
    public List<ProductEntity> getSaleProducts(){
        return (List<ProductEntity>) productRepository.findSaleProduct();
    }
}
