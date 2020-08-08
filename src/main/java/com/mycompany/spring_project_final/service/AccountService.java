/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.AccountRoleEntity;
import com.mycompany.spring_project_final.enums.AccountRole;
import com.mycompany.spring_project_final.repositories.AccountRepository;
import com.mycompany.spring_project_final.repositories.AccountRoleRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AccountRoleRepository accountRoleRepository;

    public AccountEntity findAccountByEmailAndPassword(String email, String password) {
        return accountRepository.findByEmailLikeAndPasswordLikeAndStatusLike(email, password,"confirmed");
    }
    public AccountEntity findAccountByEmail(String email){
        return accountRepository.findByEmail(email);
    }
    public AccountEntity findAccountById(int id){
        return accountRepository.findById(id);
    }

    public void updateAccount(AccountEntity account){
        accountRepository.save(account);
    }
    public void save(AccountEntity account) {

        AccountRoleEntity accountRoleEntity = accountRoleRepository.findByRole(AccountRole.ROLE_USER);
        if(accountRoleEntity == null){
            accountRoleEntity = new AccountRoleEntity();
            accountRoleEntity.setRole(AccountRole.ROLE_USER);
        }
        
        List<AccountRoleEntity> listRoles = new ArrayList<>();
        listRoles.add(accountRoleEntity);

        account.setAccountRoles(listRoles);
        System.out.println(account.getPassword());
        accountRepository.save(account);
    }
}
