package com.rental.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.rental.service.UserLogService;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired 
	private UserLogService service;
	
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication auth) throws IOException, ServletException {
			// TODO Auto-generated method stub
			log.warn("Login Success");
			
			
			List<String> roleNames = new ArrayList<>();
			
			auth.getAuthorities().forEach(authority -> {
				roleNames.add(authority.getAuthority());
			});
			
			log.warn("ROLE NAMES : " + roleNames);
			service.UserLoginSuccess(auth.getName());
			if(roleNames.contains("ROLE_ADMIN")) {
				response.sendRedirect("/admin/index?userid="+auth.getName());		
				return;
			}
			
			if(roleNames.contains("ROLE_USER")) {
				service.UserLoginSuccess(auth.getName());
				response.sendRedirect("/");
				return;
			}
			
			response.sendRedirect("/");
	}
	
	
	
}
