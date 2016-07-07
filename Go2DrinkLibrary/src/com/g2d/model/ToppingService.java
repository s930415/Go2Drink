/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Topping;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class ToppingService {

    public Topping get(int id) throws SQLException, Go2DrinkException {

        RDBToppingDAO dao = new RDBToppingDAO();
        Topping t = dao.get(id);
        return t;

    }

    public Topping get(String name) throws SQLException, Go2DrinkException {

        RDBToppingDAO dao = new RDBToppingDAO();
        Topping t = dao.get(name);
        return t;

    }

}
