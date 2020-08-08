/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.entities;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name="orderr")
public class OrderEntity extends PersonalInformation{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Temporal(TemporalType.DATE)
    @Column(name="order_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;
    
    @Temporal(TemporalType.DATE)
    @Column(name="delivery_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deliveryDate;
    
    private String status;
    
    @Column(name = "total_price")
    private double totalPrice;
    
    @ManyToOne
    @JoinColumn(name="account_id")
    private AccountEntity account;
    
    @OneToMany(mappedBy = "order" , fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrderDetailEntity> orderDetails;
    
    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    private VerificationOrderToken verificationOrderToken;

    public List<OrderDetailEntity> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetailEntity> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public VerificationOrderToken getVerificationOrderToken() {
        return verificationOrderToken;
    }

    public void setVerificationOrderToken(VerificationOrderToken verificationOrderToken) {
        this.verificationOrderToken = verificationOrderToken;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
    
}
