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
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		log.info("insert() GET 방식 호출");
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Board board) {
		//log.info("insert({},{},{}) POST 호출", title, content, userid);
		// String title, String content, String userid
		log.info("insert({}) POST 호출", board);
		// 클라이언트에서 보낸 데이터들을 서비스 계층의 객체 (메서드)를 사용해서 새 글 작성 서비스 완료 후
		// 게시판 메인 페이지로 이동(redirect)
		boardService.insert(board);
		 
		return "redirect:/board/main";
	}
	
	
}