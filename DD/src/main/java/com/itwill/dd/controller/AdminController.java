package com.itwill.dd.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.service.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
		
	@RequestMapping(value = "/goods/main", method = RequestMethod.GET)
	public void getMain() throws Exception {
		
		log.info("getMain 호출");
	}
	
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister() throws Exception {
		log.info("getGoodsRegister 호출");
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(ProductVO product) throws Exception {
		log.info("postGoodsRegister 호출");
		
		adminService.register(product);
		
		return "redirect:/admin/main";
	}
	
	// 상품 목록	
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) {
		log.info("getGoodsList 호출");
		
		List<ProductVO> list = adminService.goodsList();
		
		model.addAttribute("list", list);
		
	}
	

}
