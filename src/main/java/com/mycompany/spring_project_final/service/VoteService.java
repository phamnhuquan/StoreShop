/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.VoteEntity;
import com.mycompany.spring_project_final.repositories.VoteRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VoteService {
    @Autowired
    private VoteRepository voteRepository;
    
    public void save (VoteEntity vote){
        voteRepository.save(vote);
    }
    public List<VoteEntity> getVotes(){
        return (List<VoteEntity>) voteRepository.findAll();
    }
    public List<VoteEntity> getVoteByProductId(int idPro){
        List<VoteEntity> listVotes = getVotes();
        List<VoteEntity> listVotesByProduct = new ArrayList<>();
        for( int i = 0; i < listVotes.size() ; i++){
            if(listVotes.get(i).getProduct().getId() == idPro){
                listVotesByProduct.add(listVotes.get(i));
            }
        }
        return listVotesByProduct;
    }
    public int countReview(int proId){
        return voteRepository.countReview(proId);
    }
}
