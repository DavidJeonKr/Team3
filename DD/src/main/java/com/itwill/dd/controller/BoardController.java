package com.itwill.dd.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dd.domain.Board;
import com.itwill.dd.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	
	@Autowired private BoardService boardService;
		
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model) {
		log.info("main() 호출");
		
		
		List<Board> list = boardService.select();
		model.addAttribute("boardList", list);
		
	
	}
	
	
}