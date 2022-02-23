package com.itwill.dd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dd.domain.Diary;
import com.itwill.dd.domain.User;
import com.itwill.dd.service.DiaryService;
import com.itwill.dd.service.UserService;


@Controller
@RequestMapping(value = "/search")
public class SearchController {
	private static final Logger log = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/search/{search}", method = RequestMethod.GET)
	public ResponseEntity<List<User>> search(@PathVariable(name="search") String search) {
		log.info("search:{}", search);
		List<User> result = userService.getSearchVal(search);
		log.info("{}",result);
		ResponseEntity<List<User>>entity = new ResponseEntity<>(result, HttpStatus.OK);
		return entity;
	}
}

	


