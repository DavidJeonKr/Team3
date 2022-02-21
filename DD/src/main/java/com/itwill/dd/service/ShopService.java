package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;

public interface ShopService {
	
	// 카트 담기
	int addCart(CartVO cart);
	
	// 카트 리스트
	List<CartListVO> cartList(String userId);

}
