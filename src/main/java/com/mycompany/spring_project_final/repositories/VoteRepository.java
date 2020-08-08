/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.repositories;

import com.mycompany.spring_project_final.entities.VoteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VoteRepository extends CrudRepository<VoteEntity, Integer>{
    
    @Query(value =  "SELECT *\n" +
                    "FROM vote v\n" +
                    "WHERE v.product_id = 6\n" +
                    "order by v.vote_date desc, v.id desc",
    nativeQuery = true)
    public List<VoteEntity> getVotes();
    
    @Query(value =  "SELECT COUNT(*)\n" +
                    "FROM vote t\n" +
                    "WHERE t.product_id = ?1",
    nativeQuery = true)
    public int countReview(int id);
}
