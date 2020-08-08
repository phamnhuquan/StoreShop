/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.AccountRoleEntity;
import com.mycompany.spring_project_final.enums.AccountRole;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRoleRepository extends CrudRepository< AccountRoleEntity, Integer> {

    public AccountRoleEntity findByRole(AccountRole role);
    
    public List<AccountRoleEntity> findByAccountsIn(List<AccountEntity> accounts);
}
