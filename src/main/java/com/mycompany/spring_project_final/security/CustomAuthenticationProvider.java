/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.security;

import com.mycompany.spring_project_final.entities.AccountEntity;
import com.mycompany.spring_project_final.entities.AccountRoleEntity;
import com.mycompany.spring_project_final.repositories.AccountRoleRepository;
import com.mycompany.spring_project_final.service.AccountService;
import com.mycompany.spring_project_final.utils.HashPassword;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class CustomAuthenticationProvider implements
        AuthenticationProvider {

    @Autowired
    private AccountService accountService;
    
    @Autowired
    private AccountRoleRepository accountRoleRepository;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String email = a.getName().trim();
        String password = HashPassword.hashPass(a.getCredentials().toString().trim());
        if (!StringUtils.isEmpty(email)
                && !StringUtils.isEmpty(password)) {
            AccountEntity account = accountService.findAccountByEmailAndPassword(email, password);
            if (account != null && account.getId() > 0) {
                List<AccountEntity> accounts = new ArrayList<AccountEntity>();
                accounts.add(account);
                List<AccountRoleEntity> accountRoles = accountRoleRepository.findByAccountsIn(accounts);
                List<GrantedAuthority> roles = new ArrayList<>();
                for (AccountRoleEntity accountRole : accountRoles) {
                    roles.add(
                            new SimpleGrantedAuthority(accountRole.getRole().toString().trim())
                    );
                }
                return new UsernamePasswordAuthenticationToken(account, account.getEmail(), roles);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
