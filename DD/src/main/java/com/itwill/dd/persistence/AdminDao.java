package com.itwill.dd.persistence;

import java.util.List;


import com.itwill.dd.domain.ProductVO;

public interface AdminDao {
	
	// 상품 등록
	int register(ProductVO product);
	
	// 상품 목록
	List<ProductVO> goodsList();
}
