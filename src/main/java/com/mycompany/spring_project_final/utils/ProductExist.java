/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_project_final.utils;

import com.mycompany.spring_project_final.model.Item;
import java.util.List;

public class ProductExist {
    
    public static int existsPro(int idPro, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId() == idPro) {
                return i;
            }
        }
        return -1;
    }

    public static int exists(int idPro, int colorId, int sizeId, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId() == idPro) {
                if (cart.get(i).getProduct().getProductDetailInOrder().getSize().getId() == sizeId && 
                        cart.get(i).getProduct().getProductDetailInOrder().getColor().getId() == colorId) {
                    return i;
                }
            }
        }
        return -1;
    }
}
