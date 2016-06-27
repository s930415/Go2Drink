/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;
import com.g2d.domain.DrinkType;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class ProductService {

        private RDBProductDAO dao = new RDBProductDAO();
        
        public void insert(Product p) throws Go2DrinkException {
        dao.insert(p);
    }

    public List<Product> getAll() throws Go2DrinkException, SQLException {
        return dao.getAll();
    }

    public Product get(String name) throws Go2DrinkException, SQLException{
        return dao.get(name);
    }

    public void delete(Product p) throws Go2DrinkException {
        dao.delete(p);
    }
    
    public List<Product> getByDrinkType(DrinkType drinktype) throws Go2DrinkException, SQLException {
        return dao.getByDrinkType(drinktype);
    }
    
     public Product get(int id) throws Go2DrinkException, SQLException{
        return dao.get(id);
    }
}
