package com.itwill.dd.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.itwill.dd.domain.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void signin() {
		log.info("signin Test");
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(@DateTimeFormat(pattern="yyyy-MM-dd") Date birthday1, User user) {
		Date d = new Date();
		user.setBirthday(birthday1);
		log.info("signin{USER:{}} POST ", user);
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		log.info("login Test");
	}
	
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public void reset() {
		log.info("reset Test");
	}
}
