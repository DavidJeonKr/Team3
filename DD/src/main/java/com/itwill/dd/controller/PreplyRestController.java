package com.itwill.dd.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.dd.domain.Preply;
import com.itwill.dd.service.PreplyService;

@RestController
@RequestMapping(value = "/preplies")
public class PreplyRestController {
	private static final Logger log = LoggerFactory.getLogger(PreplyRestController.class);

	@Autowired PreplyService preplyService;
	
	@RequestMapping(value = "/all/{ptno}", method = RequestMethod.GET)
	public ResponseEntity<List<Preply>> readAllReplies(@PathVariable(name = "ptno") Integer ptno) {
		log.info("readAllReplies(ptno={})", ptno);
		
		List<Preply> preplyList = preplyService.select(ptno);
		ResponseEntity<List<Preply>> entity = new ResponseEntity<List<Preply>>(preplyList, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> createReply(@RequestBody Preply preply) {
		// @RequestBody: 클라이언트가 보내는 데이터가 요청 패킷 본문(body)에 포함되어 있다고 선언하는 어노테이션.
		// 요청 시 보내는 데이터가 query string에 포함되어 있지 않고, form data도 아닌 경우에 사용.
		log.info("createReply({})", preply);
		
		int result = preplyService.insert(preply);
		
		ResponseEntity<Integer> entity = new ResponseEntity<>(result, HttpStatus.OK);
		
		return entity;
	}
}
