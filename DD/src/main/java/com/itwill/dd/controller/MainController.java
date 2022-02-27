package com.itwill.dd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dd.domain.User;
import com.itwill.dd.service.UserService;

@Controller
public class MainController {
	
	@Autowired UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String main(User user, Model model, HttpServletRequest request) {
		
		User signInUser = userService.checkSignIn(user);
		if(signInUser == null) {
			return "redirect:/";
		}else {
			// TODO: 로그인 유저 정보 넘기기
			HttpSession session = request.getSession();
			session.setAttribute("userid", signInUser);
			return "redirect:/diary/calendar?userid="+user.getUserid();
		}
		
	}

	
}
