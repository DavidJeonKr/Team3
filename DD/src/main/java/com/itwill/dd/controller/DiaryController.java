package com.itwill.dd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/diary")
public class DiaryController {
	private static final Logger log = LoggerFactory.getLogger(DiaryController.class);
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void calendar() {
		log.info("Diary calendar() 호출");
	}
	
}
