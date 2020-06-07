package com.rental.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rental.mapper.UserLogMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml" })
@Log4j
public class ProceserTest {
	
	@Autowired
	private UserLogMapper mapper;
	
	@Test
	public void testing() {
		
		try{
			log.warn(mapper.FullFailCount("althsuwpfl"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
