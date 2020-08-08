/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    @Query(value = "SELECT p.id,p.access_date,p.description,p.name,p.price,p.category_id,p.object_id,p.image,p.quantity,p.promotion_id FROM category c INNER JOIN product p ON c.id = p.category_id INNER JOIN object o ON p.object_id = o.id \n" +
                   "WHERE c.name like ?1 and p.name like %?2% and o.name like ?3",
            nativeQuery = true)
    public List<ProductEntity> findProductByCategoryNameOrProductNameOrObjectName(String cateforyName, String productName, String objectName);
    
    //all product
    @Query(value = "SELECT * FROM product p \n" +
                   "order by access_date desc, id desc",
            nativeQuery = true)
    public List<ProductEntity> findAllProduct();
    
    //all product men
    @Query(value = "SELECT * FROM product p\n" +
                   "WHERE p.object_id = 1",
            nativeQuery = true)
    public List<ProductEntity> findProductByObjectMen();
    
    //all product women
    @Query(value = "SELECT * FROM product p\n" +
                   "WHERE p.object_id = 2",
            nativeQuery = true)
    public List<ProductEntity> findProductByObjectWomen();
    
    //new product
    @Query(value = "SELECT * FROM product p\n" +
                   "WHERE p.promotion_id = 4\n" +
                   "ORDER BY p.access_date desc, p.id desc",
            nativeQuery = true)
    public List<ProductEntity> findNewProduct();
    
    //sale product
    @Query(value = "SELECT * FROM product p \n" +
                   "WHERE p.promotion_id != 4\n" +
                   "ORDER BY p.access_date desc, p.id desc",
            nativeQuery = true)
    public List<ProductEntity> findSaleProduct();
}
