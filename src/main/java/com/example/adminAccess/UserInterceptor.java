package com.example.adminAccess;

import org.springframework.stereotype.Component;
import jakarta.servlet.http.*;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class UserInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	        throws Exception {

	    String userName = (String) request.getSession().getAttribute("userName");

	    // Only allow access if a user is logged in and NOT the admin
	    if (userName == null || "admin12@login.com".equals(userName)) {
	        response.sendRedirect("/login/form");
	        return false;
	    }

	    return true;
	}

}

