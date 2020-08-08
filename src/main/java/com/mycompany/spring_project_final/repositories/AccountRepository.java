/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.AccountEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AccountRepository extends
        CrudRepository<AccountEntity, Integer> {

    AccountEntity findByEmailLikeAndPasswordLikeAndStatusLike(
            String email, String password, String status);

    @Query(value = "SELECT acc.email, acc.password , acc.status\n"
            + "FROM account acc\n"
            + "WHERE acc.email like ?1  and acc.password like ?1 and status = 'confirmed';",
            nativeQuery = true)
    public AccountEntity findAccountByEmailAndPassword(String email, String password);

    AccountEntity findByEmail(String email);
    AccountEntity findById(int id);

}
