/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
public class PerformanceFilter implements Filter {   
    private FilterChain filterChain;
    private String prefix = "Performance:";
    private FilterConfig filterConfig;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        String perfix = filterConfig.getInitParameter("Prefix");
        if(prefix!=null){
            this.prefix = prefix;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
         long begin = System.currentTimeMillis();
                 
         chain.doFilter(request, response);
         
         long gap = System.currentTimeMillis()-begin;
         
         filterConfig.getServletContext().log(prefix + ", 執行" + ((HttpServletRequest)request).getRequestURL() + "花費" + gap + "ms");
    }

    @Override
    public void destroy() {
        
    }
  
}
