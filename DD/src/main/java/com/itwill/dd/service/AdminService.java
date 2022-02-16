package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.ProductVO;

public interface AdminService {
	
	// 상품 등록
	int register(ProductVO product);

	// 상품 목록
	List<ProductVO> goodsList();
}
