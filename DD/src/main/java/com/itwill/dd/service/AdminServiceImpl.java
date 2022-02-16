package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.persistence.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminDao adminDao;
	
	// 상품 등록
	@Override
	public int register(ProductVO product) {
		log.info("AdminServiceImpl 호출");
		return adminDao.register(product);
	}

	// 상품 목록
	@Override
	public List<ProductVO> goodsList() {
		log.info("goodsList 호출");
		return adminDao.goodsList();
	}

}
