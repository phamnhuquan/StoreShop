/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.FavoriteEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FavouriteRepository extends CrudRepository<FavoriteEntity, Integer>{
    public FavoriteEntity findByAccount(int id);
    
    
        @Query(value = "SELECT * FROM favorite f\n" +
                        "WHERE f.account_id = ?1 and f.product_id = ?2",
            nativeQuery = true)
    public FavoriteEntity findByAccountAndProduct(int accId, int proId);
}
