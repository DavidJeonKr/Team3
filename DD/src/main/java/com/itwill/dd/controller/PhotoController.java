package com.itwill.dd.controller;


import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.dd.domain.Photo;
import com.itwill.dd.domain.User;
import com.itwill.dd.service.PhotoService;
import com.itwill.dd.service.UserService;
import com.itwill.dd.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/photo")
public class PhotoController {
	private static final Logger log = LoggerFactory.getLogger(PhotoController.class);

	@Autowired
	PhotoService photoService;
	@Autowired
	UserService userService;
	
	// servlet-context.xml에서 설정한 uploadPath 추가
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//main 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void photomain(Model model, String userid) throws Exception{
		List<Photo> photo = photoService.selectall(userid);
		log.info("photomain() 호출");
		log.info("photo: {}", photo.toString());
		
		model.addAttribute("photo", photo);
		
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
	}
	//new_post 이동
	@RequestMapping(value = "/new_post", method = RequestMethod.GET)
	public void newpost(HttpSession session, Model model) {
//		log.info("new post post방식 0000000000000001111111111111{}",userid);
//		User user = userService.userInfo(userid);
//		model.addAttribute("userInfo", user);
//		log.info("new_post() 호출");
		User user = (User)session.getAttribute("userid");
		model.addAttribute("userInfo", user);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int ptno, String userid, Model model) {
		log.info("delete({}) get 호출", ptno);
		
		User user = userService.userInfo(userid);
		model.addAttribute("userInfo", user);
		
		photoService.delete(ptno);
		
		return "redirect:/photo/main?userid="+user.getUserid();
		
	}

//	@RequestMapping(value = "/new_post", method = RequestMethod.POST)
//	public String addpost(@RequestParam("file") MultipartFile file, @RequestParam("userid") String userid,
//			@RequestParam("content") String content, HttpServletRequest request) throws IOException {
//
//		log.info("addpost({}, {})", file);
//		log.info("userid: {}, content: {}", userid, content);
//		
//		// 파일 경로
//		String contextRoot = request.getServletContext().getRealPath("/resources/photo/");
//		URL r = this.getClass().getResource("");
//		String path = r.getPath();
//		
//		log.info(contextRoot);
//		log.info("경로: {}", path);
//		
//		File dir = new File(contextRoot);
//		//폴더 없을 경우 폴더 생성
//		if (!dir.exists()) { dir.mkdirs(); }
//		//String path = "C:/tmp/";
//
//		// 파일 생성
//		file.transferTo(new File(contextRoot + file.getOriginalFilename()));
//		// TODO: 저장파일이름 변경
//		photoService.insert(file, userid, content);
//		return "redirect:/photo/main";
//	}
	
	//add post
	@RequestMapping(value = "/new_post", method = RequestMethod.POST)
	public String addpost(Photo photo,@RequestParam("file") MultipartFile file) throws Exception {
		
		log.info("photo: {}", photo);
		log.info("file: {}", file);
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		photo.setFilename(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		photoService.insert(photo);
		return "redirect:/photo/main?userid="+photo.getUserid();
		//"redirect:/board/main?userid="+board.getUserid();
	}
	
	

}
