package com.itwill.dd.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwill.dd.domain.Board;
import com.itwill.dd.domain.Diary;
import com.itwill.dd.domain.User;
import com.itwill.dd.service.BoardService;
import com.itwill.dd.service.UserService;
@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
			@Autowired 
	private BoardService boardService;
	@Autowired
	private UserService userService;
		@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model, String userid) {
		log.info("Board main() 호출");
		
		
		// List<Board> list = boardService.select();
		//model.addAttribute("boardList", list);
		
		List<Board> list = boardService.select(userid);
		model.addAttribute("boardList", list);
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
		
//		User user = (User)session.getAttribute("userid");
//		String userid1 = user.getUserid();
//			if(userid != null) {
//			if(userid.equals(userid1)) {
//				List<Board> list = boardService.select(userid1);
//				model.addAttribute("boardList", list);
//				model.addAttribute("userInfo", user);
//				
//				
//			}else {
//				List<Board> list = boardService.select(userid);
//				model.addAttribute("boardList", list);
//				User user2 = userService.userInfo(userid);
//				model.addAttribute("userInfo", user2);
//				
//			}
//		}else {
//			List<Board> list = boardService.select(userid1);
//			model.addAttribute("boardList", list);
//			model.addAttribute("userInfo", user);
//			
//			
//		}
	}
		@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert(HttpSession session, Model model) {
		log.info("insert() GET 방식 호출");
		
		
		
		
		User user = (User)session.getAttribute("userid");
		model.addAttribute("userInfo", user);
//		String userid1 = user.getUserid();
//			if(userid != null) {
//			if(userid.equals(userid1)) {		
//				model.addAttribute("userInfo", user);	
//			}else {
//				
//				User user2 = userService.userInfo(userid);
//				model.addAttribute("userInfo", user2);
//			}
//		}else {
//			model.addAttribute("userInfo", user);
//		}
		}
		@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Board board) {
		
		log.info("insert({}) POST 호출", board);
		
		boardService.insert(board);
		return "redirect:/board/main?userid="+board.getUserid();
	}
		@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(int bno, Model model, String userid) {
		log.info("detail(bno={}) GET 호출", bno);
		
		Board board = boardService.select(bno);
		model.addAttribute("board", board);
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
		
		
		//Board board = boardService.select(bno);
		//model.addAttribute("board", board);
		
//		User user = (User)session.getAttribute("userid");
//		String userid1 = user.getUserid();
//			if(userid != null) {
//			if(userid.equals(userid1)) {
//				
//				Board board = boardService.select(bno);
//				model.addAttribute("board", board);
//				model.addAttribute("userInfo", user);
//				
//				
//			}else {
//				Board board = boardService.select(bno);
//				model.addAttribute("board", board);
//				User user2 = userService.userInfo(userid);
//				model.addAttribute("userInfo", user2);
//				
//			}
//		}else {
//			Board board = boardService.select(bno);
//			model.addAttribute("board", board);
//			model.addAttribute("userInfo", user);
//			
//			
//		}
	}
		@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(int bno, Model model, String userid) {
		log.info("update(bno={}) GET 호출", bno);
		
		Board board = boardService.select(bno);
		model.addAttribute("board", board);
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
		
		//Board board = boardService.select(bno);
		//model.addAttribute("board", board);
		
//		User user = (User)session.getAttribute("userid");
//		String userid1 = user.getUserid();
//			if(userid != null) {
//			if(userid.equals(userid1)) {
//				
//				Board board = boardService.select(bno);
//				model.addAttribute("board", board);
//				model.addAttribute("userInfo", user);
//				
//				
//			}else {
//				Board board = boardService.select(bno);
//				model.addAttribute("board", board);
//				User user2 = userService.userInfo(userid);
//				model.addAttribute("userInfo", user2);
//				
//			}
//		}else {
//			Board board = boardService.select(bno);
//			model.addAttribute("board", board);
//			model.addAttribute("userInfo", user);
//			
//			
//		}
		
	}
		@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Board board, String userid) {
		log.info("update({}) POST 호출", board);
		
		boardService.update(board); // 게시글 수정 서비스 완료.
		
		return "redirect:/board/main?userid="+userid; // 게시판 메인으로 이동.
	}
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model, String userid,int bno) {
		log.info("delete(bno={}) 호출", bno);
		
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
		
//		User user = (User)session.getAttribute("userid");
//		String userid1 = user.getUserid();
//			if(userid != null) {
//			if(userid.equals(userid1)) {		
//				model.addAttribute("userInfo", user);	
//			}else {
//				
//				User user2 = userService.userInfo(userid);
//				model.addAttribute("userInfo", user2);
//			}
//		}else {
//			model.addAttribute("userInfo", user);
//		}
		
		boardService.delete(bno);
		return "redirect:/board/main?userid="+userid;
	}
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String search(String userid, int type, String keyword, Model model) {
			log.info("search(type={}, keyword={})", type, keyword);
			
			List<Board> list = boardService.select(type, keyword, userid);
			model.addAttribute("boardList", list);
			model.addAttribute("userInfo", userService.userInfo(userid));
			
			return "board/main"; 
			
		}
	}
