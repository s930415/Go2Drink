/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.domain;

/**
 *
 * @author Administrator
 */
public class Go2DrinkException extends Exception {

    /**
     * Creates a new instance of <code>Go2DrinkException</code> without detail
     * message.
     */
    public Go2DrinkException() {
    }

    /**
     * Constructs an instance of <code>Go2DrinkException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public Go2DrinkException(String msg) {
        super(msg);
    }

    public Go2DrinkException(String message, Throwable cause) {
        super(message, cause);
    }
}
