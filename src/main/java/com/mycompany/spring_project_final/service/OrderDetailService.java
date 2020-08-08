/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_project_final.repositories.OrderDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    public List<OrderDetailEntity> getOrderDetails(){
        return (List<OrderDetailEntity>) orderDetailRepository.findAll();
    }
    public void save(OrderDetailEntity orderDetailEntity){
        
        orderDetailRepository.save(orderDetailEntity);
    }
    
    public OrderDetailEntity findOrderDetailById(int orderId){
        return orderDetailRepository.findOne(orderId);
    }
    public List<OrderDetailEntity> getOrderDetailsByOrderId(int orderId){
        return (List<OrderDetailEntity>) orderDetailRepository.findOrderDetaiByOrder(orderId);
    }
}
