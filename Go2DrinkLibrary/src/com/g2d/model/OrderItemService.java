/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.OrderItem;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class OrderItemService {
    RDBOrderItemDAO dao = new RDBOrderItemDAO();
    
        public List<OrderItem> getAll(int id) throws Go2DrinkException {
        return dao.getAll(id);
    }
    
}
