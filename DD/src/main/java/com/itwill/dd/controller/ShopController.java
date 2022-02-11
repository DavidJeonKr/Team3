package com.itwill.dd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void shopmain() {
		
	}
	
	@RequestMapping(value = "/music", method = RequestMethod.GET)
	public void shopMusic() {
		
	}
	
	@RequestMapping(value = "/background", method = RequestMethod.GET)
	public void shopBackground() {
		
	}
	
	@RequestMapping(value = "/musicdetail", method = RequestMethod.GET)
	public void shopMusicDetail() {
		
	}
	
	@RequestMapping(value = "/bgdetail", method = RequestMethod.GET)
	public void shopBgDetail() {
		
	}
}
