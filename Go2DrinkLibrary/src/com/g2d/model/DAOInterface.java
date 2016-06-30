/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import java.util.List;
import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;

/**
 *
 * @author Administrator
 */
public interface DAOInterface<K, T> {

    void create(T c) throws Go2DrinkException;

    void delete(T c) throws Go2DrinkException;

    T get(K id) throws Go2DrinkException;

    List<T> getAll() throws Go2DrinkException;

    void update(T c) throws Go2DrinkException;
    
}
