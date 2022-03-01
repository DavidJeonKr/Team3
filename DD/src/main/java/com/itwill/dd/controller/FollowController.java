package com.itwill.dd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dd.domain.Follow;
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
	public String followCk(String followerid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followerid);
		if(followService.checkFollow(signInUser.getUserid(),followerid)) {
			return "follow";
		}else {
			return "unfollow";
		}
		
	}
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public String followAdd(String followerid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followerid);
		if(followService.addFollow(signInUser.getUserid(), followerid)) {
			return "FollowOk";
		}else {
			return "FollowNotOk";
		}
		
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public String followDelete(String followerid, HttpSession session) {
		User signInUser = (User)session.getAttribute("userid");
		log.info("{}",followerid);
		if(followService.deleteFollow(signInUser.getUserid(), followerid)) {
			return "UnFollowOk";
		}else {
			return "UnFollowNotOk";
		}
		
	}
	
	@RequestMapping(value = "/followid/{followid}", method = RequestMethod.GET)
	public ResponseEntity<List<User>> followList(@PathVariable(name="followid") String followid) {
		log.info("search:{}", followid);
		List<Follow> followList = followService.followList(followid);
		List<User> result = new ArrayList<User>();
		for(Follow f : followList) {
			result.add(userService.userInfo(f.getFollowerid()));
		}
		log.info("{}",result);
		ResponseEntity<List<User>>entity = new ResponseEntity<>(result, HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping(value = "/followerid/{followerid}", method = RequestMethod.GET)
	public ResponseEntity<List<User>> followerList(@PathVariable(name="followerid") String followerid) {
		log.info("search:{}", followerid);
		List<Follow> followerList = followService.followerList(followerid);
		List<User> result = new ArrayList<User>();
		for(Follow f : followerList) {
			result.add(userService.userInfo(f.getFollowid()));
		}
		log.info("{}",result);
		ResponseEntity<List<User>>entity = new ResponseEntity<>(result, HttpStatus.OK);
		return entity;
	}
	
	
}
