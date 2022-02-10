package com.itwill.dd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void signin() {
		log.info("signin Test");
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
