package com.example.adminAccess;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.*;


@Component
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
     
        String userName = (String) request.getSession().getAttribute("userName");

        
        if (userName == null || !"admin12@login.com".equals(userName)) {
            response.sendRedirect("/login/form"); 
            return false;
        }
        return true; 
    }
}

