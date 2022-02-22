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

import com.itwill.dd.domain.Diary;
import com.itwill.dd.domain.User;
import com.itwill.dd.service.DiaryService;


@Controller
@RequestMapping(value = "/diary")
public class DiaryController {
	private static final Logger log = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	private DiaryService diaryService;
	
//	@RequestMapping(value = "/calendar/{userid}", method = RequestMethod.GET)
//	public ResponseEntity<List<Diary>> readAllDiary(@PathVariable(name = "userid") String userid) {
//		log.info("readAllDiary(userid = {})", userid);
//		
//		List<Diary> diaryList = diaryService.select(userid);
//		
//		ResponseEntity<List<Diary>> entity = new ResponseEntity<List<Diary>>(diaryList, HttpStatus.OK);
//		
//		return entity;	
//	}	
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void main(HttpSession session, Model model) {
		log.info("Diary main() 호출");		
		
		User user = (User)session.getAttribute("userid");
		String userid = user.getUserid();
		
		List<Diary> schedule = diaryService.select(userid);
		model.addAttribute("schedule", schedule);
		
		for (Diary d:schedule) {
			log.info(d.toString());
		}
	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.POST)
	public String insert(HttpSession session, Diary diary) {
		log.info("Diary insert() 호출", diary);
		
		User user = (User)session.getAttribute("userid");
		String userid = user.getUserid();
		diary.setUserid(userid);
		
		diaryService.insert(diary);
		return "redirect:/diary/calendar";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int dno) {
		log.info("Diary delete(dno = {})", dno);
		diaryService.delete(dno);
		return "redirect:/diary/calendar";
		
	}	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Diary diary) {
		log.info("Diary update({})호출" , diary);
		diaryService.update(diary);
		return "redirect:/diary/calendar";
	}
	
	
}
