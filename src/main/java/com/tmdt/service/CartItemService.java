package com.tmdt.service;

import com.tmdt.dao.CartItemDAO;
import com.tmdt.mapper.CartItemMapper;
import com.tmdt.model.CartItemModel;
import com.tmdt.model.ProductModel;

import javax.inject.Inject;
import java.util.List;

public class CartItemService {
    @Inject
    CartItemDAO cartItemDAO;
    public List<CartItemModel> findAll(){
        return cartItemDAO.findAll();
    }

    public List<CartItemModel> findByCartId(int cart_id){
        return cartItemDAO.findByCartId(cart_id);
    }

    public int save(CartItemModel cartItemModel) {
        return cartItemDAO.save(cartItemModel);
    }
}
