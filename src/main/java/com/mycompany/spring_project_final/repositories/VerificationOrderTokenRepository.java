/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.VerificationOrderToken;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VerificationOrderTokenRepository extends CrudRepository<VerificationOrderToken, Integer>{
    VerificationOrderToken findByToken(String token);
    
    @Query(value = "SELECT * FROM verification_order_token v\n" +
                    "WHERE v.order_id = ?1",
            nativeQuery = true)
    public VerificationOrderToken findTokenByOrder(int orderId);
}
