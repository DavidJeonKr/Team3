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
import com.itwill.dd.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private UserService userService;
	@Autowired private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signup() {
		log.info("signin Test");
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@DateTimeFormat(pattern="yyyy-MM-dd") Date birthday1, User user) {
		user.setBirthday(birthday1);
		log.info("signin{USER:{}} POST ", user);
		
		// 회원가입 정보 저장
		userService.registerNewUser(user);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserEmail(String userid) {
		log.info("{}",userService.isValidEmail(userid));
		if(userid=="") {
			return "empty";
		}else if(userService.isValidEmail(userid)) {
			return "notFound";
		}else {
			return "find";
		}
	}
	
	/* 이메일 인증 */
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "gmk0614@daum.net";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"DailyDiary를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
	
		
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public void reset() {
		log.info("reset Test");
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String reset2() {
		log.info("reset Test");
		return "redirect:/";
	}
	
	
	/* 비밀번호 보내기 */
	@RequestMapping(value="/passReset", method=RequestMethod.GET)
	@ResponseBody
	public void passRestGet(String email) throws Exception{
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(88888888) + 11111111;
		log.info("비밀번호 " + checkNum);
		
		/* 이메일 보내기 */
		String setFrom = "gmk0614@daum.net";
		String toMail = email;
		String title = "비밀번호 변경 이메일 입니다.";
		String content = 
				"DailyDiary를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"변경된 비밀번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 비밀번호로 로그인 해주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		userService.updatePass(email, num);
		
		
	}
	
	@RequestMapping(value = "/profile_edit_main", method = RequestMethod.GET)
	public void profileEdit(Model model, HttpSession session) {
		User userid = (User) session.getAttribute("userid");

		userid.getBirthday().toString();


		User userInfo = userService.userInfo(userid.getUserid());
		model.addAttribute("userInfo", userInfo);
		
	}
	
	@RequestMapping(value = "/profile_edit_main", method = RequestMethod.POST)
	public String porfileEdit(@DateTimeFormat(pattern="yyyy-MM-dd") Date birthday1, User user) {
		user.setBirthday(birthday1);
		userService.updateUserInfo(user);
		return "redirect:/user/profile_edit_main";
	}
	
	@RequestMapping(value = "/pass_change", method = RequestMethod.GET)
	public void passEdit(Model model, HttpSession session) {
		User userInfo = (User) session.getAttribute("userid");
		model.addAttribute("userInfo", userInfo);
	}
	
	@RequestMapping(value = "/pass_change", method = RequestMethod.POST)
	public String passEdit(String userid, String password) {
		
		userService.updatePass(userid, password);
		
		return "redirect:/diary/calendar";
	}
	
	@RequestMapping(value = "/checkpass", method=RequestMethod.POST)
	@ResponseBody
	public String passCheckToEdit(HttpSession session, String pass) {
		User user = (User)session.getAttribute("userid");
		log.info("{}",pass);
		log.info("{}",userService.passCheck(user.getUserid(), pass));
		if(userService.passCheck(user.getUserid(), pass)) {
			return "success";
		}else {
			return "fail";
		}
		
		
	}
	
	@RequestMapping(value="/deleteUserInfo", method = RequestMethod.GET)
	@ResponseBody
	public String deleteUser(String userid) {
		log.info("{}",userid);
		userService.deleteUserInf(userid);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		session.removeAttribute("userid");
		session.invalidate();
		
		return "redirect:/";
	}
	
}
