package com.itwill.dd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.ProductViewVO;
import com.itwill.dd.domain.User;
import com.itwill.dd.persistence.ShopDao;
import com.itwill.dd.service.AdminService;
import com.itwill.dd.service.ShopService;




@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ShopService shopService;
	
	private static final Logger log = LoggerFactory.getLogger(ShopController.class);

	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public void shopmain(Model model) {
		
		List<ProductViewVO> list = adminService.goodsList();
		
		model.addAttribute("list", list);

		
		
	}
	
	@RequestMapping(value = "/music2", method = RequestMethod.GET)
	public void shopMusic(Model model) {
		List<ProductVO> musicList = shopService.musicList();
		
		model.addAttribute("musicList", musicList);
		
	}
	
	// 상품 조회
	@RequestMapping(value = "/musicdetail", method = RequestMethod.GET)
	public void shopMusicDetail(@RequestParam("n") int productId, Model model) {
		
		ProductViewVO product = adminService.goodsDetail(productId);
		
		model.addAttribute("product", product);
		
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public void addCart(CartVO cart, HttpSession session) {
		
		User user = (User)session.getAttribute("userid");

		log.info("userid: " + user);
		
		
		cart.setUserId(user.getUserid());
		
		
		
		shopService.addCart(cart);
		
	}
	
	// 카트 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) {
		
		User user = (User)session.getAttribute("userid");
		String userId = user.getUserid();
		
		List<CartListVO> cartList = shopService.cartList(userId);
		
		model.addAttribute("cartList", cartList);
		
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
	 log.info("delete cart");
	 
	 User user = (User)session.getAttribute("userid");
	 String userId = user.getUserid();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 // Ajax에서 전송받는 배열 chbox를 chArr로 받은뒤, for문으로 chArr이 가지고 있는 값의 갯수 만큼 반복
	 if(user != null) {
		 cart.setUserId(userId);
		  
		 for(String s : chArr) {   
			 cartNum = Integer.parseInt(s);
			 cart.setCartNum(cartNum);
			 shopService.deleteCart(cart);
		 }   
		 result = 1;
		 }  
		 return result;  
	 }
	
	// 결제
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public int payment(HttpSession session, @RequestParam(value = "chbox[]")List<String> chArr ) {
		int result = 0;
		
		return result;
	}
	
	// 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Model model, String keyword) {
		
		List<ProductVO> list = shopService.search(keyword);
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void myPage() {
		
	}
	

	
	/*
	@ResponseBody
	@RequestMapping(value = "/paymentCart1", method = RequestMethod.POST)
	public int payment(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, PaymentVO payment) {
		
		User user = (User)session.getAttribute("userid");
		String userId = user.getUserid();
		
		int result = 0;
		int userPrnum = 0;
		
		 if(user != null) {
			 payment.setUserId(userId);
			  
			 for(String s : chArr) {   
				 userPrnum = Integer.parseInt(s);
				 payment.setUserPrnum(userPrnum);
				 shopService.addPayment(payment);
			 }   
			 result = 1;
			
			 }  
			 return result;  
	}*/
	
	/*
	// 결제
	@ResponseBody
	@RequestMapping(value = "/paymentCart", method = RequestMethod.POST)
	public int payment2(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO payment) throws Exception {
	
	 
	 User user = (User)session.getAttribute("userid");
	 String userId = user.getUserid();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 // Ajax에서 전송받는 배열 chbox를 chArr로 받은뒤, for문으로 chArr이 가지고 있는 값의 갯수 만큼 반복
	 if(user != null) {
		 payment.setUserId(userId);
		  
		 for(String s : chArr) {   
			 cartNum = Integer.parseInt(s);
			 payment.setCartNum(cartNum);
			 shopService.addPayment(payment);
		 }   
		 result = 1;
		 deleteCart(session, chArr, payment);
		 }  
		 return result;  
	 }*/
	

	
	/*
	// 결제 리스트
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void profile(HttpSession session, Model model) {
		
		User user = (User)session.getAttribute("userid");
		String userId = user.getUserid();
		
		List<PaymentVO> buyList = shopService.buyList(userId);
		log.info("buyList" + buyList);
		model.addAttribute("buyList", buyList);
		
	}*/
	
	
	/*
	@ResponseBody
	@RequestMapping(value = "/deletePayment", method = RequestMethod.POST)
	public int deletePayment(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, PaymentVO payment) throws Exception {
	 log.info("delete cart");
	 
	 User user = (User)session.getAttribute("userid");
	 String userId = user.getUserid();
	 
	 int result = 0;
	 int userPrnum = 0;
	 
	 // Ajax에서 전송받는 배열 chbox를 chArr로 받은뒤, for문으로 chArr이 가지고 있는 값의 갯수 만큼 반복
	 if(user != null) {
		 payment.setUserId(userId);
		  
		 for(String s : chArr) {   
			 userPrnum = Integer.parseInt(s);
			 payment.setUserPrnum(userPrnum);
			 shopService.deletePayment(payment);
		 }   
		 result = 1;
		 }  
		 return result;  
	 }*/
}
