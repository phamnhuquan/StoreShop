
package com.mycompany.spring_project_final.service;

import com.mycompany.spring_project_final.entities.FavoriteEntity;
import com.mycompany.spring_project_final.repositories.FavouriteRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavouriteService {
    @Autowired
    private FavouriteRepository favouriteRepository;
    
    public void save (FavoriteEntity favorite){
        favouriteRepository.save(favorite);
    }
    public List<FavoriteEntity> getFavourites(){
        return (List<FavoriteEntity>) favouriteRepository.findAll();
    }
    public List<FavoriteEntity> getFavouritesByAccountId(int idAcc){
        List<FavoriteEntity> listFavorites = getFavourites();
        List<FavoriteEntity> listFavoritesByAccount = new ArrayList<>();
        for( int i = 0; i < listFavorites.size() ; i++){
            if(listFavorites.get(i).getAccount().getId() == idAcc){
                listFavoritesByAccount.add(listFavorites.get(i));
            }
        }
        return listFavoritesByAccount;
    }
    public FavoriteEntity getFavouritesByAccountIdAndProductId(int accId, int proId){
        return favouriteRepository.findByAccountAndProduct(accId, proId);
    }
    public boolean delete(int favouriteId){
        favouriteRepository.delete(favouriteId);
        return favouriteRepository.exists(favouriteId);
    }
}
