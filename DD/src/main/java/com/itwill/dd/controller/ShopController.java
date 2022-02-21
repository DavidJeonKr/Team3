package com.itwill.dd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.dd.domain.CartVO;
import com.itwill.dd.domain.ProductViewVO;
import com.itwill.dd.service.AdminService;




@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	private AdminService adminService;
	

	
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
	@RequestMapping(value = "")
	public void addCart(CartVO cart, HttpSession session) {
		
		
	}
	
	// 상품 조회
	@RequestMapping(value = "/bgdetail", method = RequestMethod.GET)
	public void shopBgDetail(@RequestParam("n") int productId, Model model) {
		
		ProductViewVO product = adminService.goodsDetail(productId);
		
		model.addAttribute("product", product);
		
	}
}
