package com.itwill.dd.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.CategoryVO;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.ProductViewVO;
import com.itwill.dd.persistence.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminDao adminDao;
	
	// 카테고리
	@Override
	public List<CategoryVO> category() {
		log.info("categoryService 호출");
		return adminDao.category();
	}
	
	// 상품 등록
	@Override
	public int register(ProductVO product) {
		log.info("registerService 호출");
		return adminDao.register(product);
	}

	// 상품 목록
	@Override
	public List<ProductViewVO> goodsList() {
		log.info("goodsListService 호출");
		return adminDao.goodsList();
	}

	// 상품 조회
	@Override
	public ProductViewVO goodsDetail(int productId) {
		log.info("goodsDetailService 호출");
		return adminDao.productDetail(productId);
	}

	// 상품 수정
	@Override
	public int goodsUpdate(ProductVO product) {
		log.info("goodsUpdateService 호출");
		return adminDao.productUpdate(product);
	}

	// 상품 삭제
	@Override
	public int goodsDelete(int productId) {
		log.info("goodsDeleteService 호출");
		return adminDao.productDelete(productId);
	}



}
