package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.CategoryVO;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.ProductViewVO;

public interface AdminDao {
	
	// 카테고리
	List<CategoryVO> category();
	
	// 상품 등록
	int register(ProductVO product);
	
	// 상품 목록
	List<ProductViewVO> goodsList();

	// 상품 조회
	ProductViewVO productDetail(int productId);
	
	// 상품 수정
	int productUpdate(ProductVO product);
	
	// 상품 삭제
	int productDelete(int productId);
	
}
