package com.itwill.dd.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

//import org.apache.tomcat.util.json.JSONParser;
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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
@RequestMapping(value = "/diary")
public class DiaryController {
	private static final Logger log = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	private DiaryService diaryService;
	@Autowired
	private UserService userService;
	
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
	
	public List<Diary> getHoliday() throws Exception {
		System.out.println("\n>>>>>>>>>>");
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Oo%2BES1TqVBZ%2BbXcx8awWhFBEOG4sTQdNtmIJXPbtnffK0pJsgpQo4ZcAgN3G2LgcBLPI9fGiVeKAmOR%2Bv8eDuw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("30", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("solYear","UTF-8") + "=" + URLEncoder.encode("2022", "UTF-8")); /*연*/
//      urlBuilder.append("&" + URLEncoder.encode("solMonth","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*월*/
        urlBuilder.append("&_type=json");
        URL url = new URL(urlBuilder.toString());
        
        System.out.println(url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb);
        System.out.println("<<<<<<<<<<\n");
       
//        JSONParser parser = new JSONParser();
//        JSONObject obj = (JSONObject)parser.parse(sb.toString());
//        JSONObject parseResponse = (JSONObject) obj.get("response");
//        JSONObject parseBody = (JSONObject) obj.get("body");
//        JSONObject parseItems = (JSONObject) obj.get("items");
//        JSONArray parseItem = (JSONArray) parseItems.get("item");
//        
//        JSONObject holidayList;
//        Diary d;
//        List<Diary> holiday = new ArrayList<Diary>();
//        
//        for(int i = 0 ; i < parseItem.size() ; i++) {
//        	holidayList = (JSONObject) parseItem.get(i);
//        	String dname = (String)holidayList.get("dateName");
//        	StringBuffer start = (StringBuffer)holidayList.get("locdate");
//        	StringBuffer end = (StringBuffer)holidayList.get("locdate");
//        	
//        	start.insert(4, "-");
//        	start.insert(6, "-");        	
//        	end.insert(4, "-");
//        	end.insert(6, "-");
//        	
//        	String start_date = start.toString();
//        	String end_date = end.toString();        	
//        	
//        	d = new Diary(0, "holiday", dname, start_date, end_date);
//        	holiday.add(d);
//        	System.out.println(holiday);
//        }
//        
//        rd.close();
//        conn.disconnect();
        return null;
	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void main(HttpSession session, Model model, String userid) throws Exception { 
		getHoliday();
		
		
		
		log.info("Diary main() 호출");		
		
		User user = (User)session.getAttribute("userid");
		String userid1 = user.getUserid();
		
		if(userid != null) {
			if(userid.equals(userid1)) {
				List<Diary> schedule = diaryService.select(userid1);
				model.addAttribute("schedule", schedule);
				model.addAttribute("userInfo", user);
				
				for (Diary d:schedule) {
					log.info(d.toString());
				}
			}else {
				List<Diary> schedule = diaryService.select(userid);
				model.addAttribute("schedule", schedule);
				User user2 = userService.userInfo(userid);
				model.addAttribute("userInfo", user2);
				for (Diary d:schedule) {
					log.info(d.toString());
				}
			}
		}else {
			List<Diary> schedule = diaryService.select(userid1);
			model.addAttribute("schedule", schedule);
			model.addAttribute("userInfo", user);
			
			for (Diary d:schedule) {
				log.info(d.toString());
			}
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

	


