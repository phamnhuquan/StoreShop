/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.OrderEntity;
import com.mycompany.spring_project_final.repositories.OrderRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    
    @Autowired
    private OrderRepository orderRepository;
    
    public List<OrderEntity> getOrders(){
        return (List<OrderEntity>) orderRepository.findAll();
    }
    public void save(OrderEntity orderEntity){
        orderEntity.setOrderDate(new Date());
        orderRepository.save(orderEntity);
    }
    public OrderEntity findOrderById(int orderId){
        return orderRepository.findOne(orderId);
    }
    public List<OrderEntity> findOrderByAccountId(int id){
        return (List<OrderEntity>) orderRepository.findOrderByAccountId(id);
    }
    public boolean delete(int orderId){
        orderRepository.delete(orderId);
        return orderRepository.exists(orderId);
    }
}
