/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class AccountEntity extends PersonalInformation{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
       
    private String password;
    
    private String enable;
    
    private String status;
    
    @OneToMany(mappedBy = "account" , fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrderEntity> orders;
    
    @OneToMany(mappedBy = "account" , fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<VoteEntity> votes;
    
    @OneToMany(mappedBy = "account" , fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<FavoriteEntity> favorites;
    
    @ManyToMany(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY)
    @JoinTable(name = "acc_role_relationship",
            joinColumns = @JoinColumn(name = "acc_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "acc_role_id",
                    referencedColumnName = "id"))
    private List<AccountRoleEntity> accountRoles;

    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    private VerificationToken verificationToken;
    
    public AccountEntity() {
    }

    public List<VoteEntity> getVotes() {
        return votes;
    }

    public void setVotes(List<VoteEntity> votes) {
        this.votes = votes;
    }

    
    public List<OrderEntity> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderEntity> orders) {
        this.orders = orders;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<AccountRoleEntity> getAccountRoles() {
        return accountRoles;
    }

    public void setAccountRoles(List<AccountRoleEntity> accountRoles) {
        this.accountRoles = accountRoles;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<FavoriteEntity> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<FavoriteEntity> favorites) {
        this.favorites = favorites;
    }

    public VerificationToken getVerificationToken() {
        return verificationToken;
    }

    public void setVerificationToken(VerificationToken verificationToken) {
        this.verificationToken = verificationToken;
    }
    
    
    

}
