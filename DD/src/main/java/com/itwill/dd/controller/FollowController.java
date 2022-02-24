package com.itwill.dd.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dd.domain.User;
import com.itwill.dd.service.FollowService;
import com.itwill.dd.service.UserService;

@Controller
@RequestMapping(value = "/follow")
public class FollowController {
	
	private static final Logger log = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired private UserService userService;
	@Autowired private FollowService followService;
	
	@RequestMapping(value="/check", method = RequestMethod.POST)
	@ResponseBody
	public String followCk(String followid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followid);
		if(followService.checkFollow(followid, signInUser.getUserid())) {
			return "follow";
		}else {
			return "unfollow";
		}
		
	}
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public String followAdd(String followid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followid);
		if(followService.addFollow(followid, signInUser.getUserid())) {
			return "FollowOk";
		}else {
			return "FollowNotOk";
		}
		
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public String followDelete(String followid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followid);
		if(followService.deleteFollow(followid, signInUser.getUserid())) {
			return "UnFollowOk";
		}else {
			return "UnFollowNotOk";
		}
		
	}
	
	
	
}
