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
import com.itwill.dd.domain.ProductViewVO;
import com.itwill.dd.domain.User;
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
	
	@RequestMapping(value = "/music", method = RequestMethod.GET)
	public void shopMusic() {
		
	}
	
	@RequestMapping(value = "/background", method = RequestMethod.GET)
	public void shopBackground() {
		
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
	public void getCartList(HttpSession session, Model model) {
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserid();
		
		List<CartListVO> cartList = shopService.cartList(userId);
		
		model.addAttribute("cartList", cartList);
		
	}
	
	// 상품 조회
	@RequestMapping(value = "/bgdetail", method = RequestMethod.GET)
	public void shopBgDetail(@RequestParam("n") int productId, Model model) {
		
		ProductViewVO product = adminService.goodsDetail(productId);
		
		model.addAttribute("product", product);
		
	}
}
