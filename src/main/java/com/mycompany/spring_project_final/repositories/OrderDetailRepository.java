/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;


import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer> {
    @Query(value = "SELECT * FROM order_detail od\n" +
                    "WHERE od.order_id = ?1",
            nativeQuery = true)
    public List<OrderDetailEntity> findOrderDetaiByOrder(int orderId);
}
