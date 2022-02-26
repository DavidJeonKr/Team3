package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;
import com.itwill.dd.domain.ProductVO;

public interface ShopService {
	 
	// 카트 담기
	int addCart(CartVO cart);
	
	// 카트 리스트
	List<CartListVO> cartList(String userId);
	
	// 카트 삭제
	int deleteCart(CartVO cart);

	// 검색
	List<ProductVO> search(String keyword);
	
	// 음악 리스트
	List<ProductVO> musicList();
	
	/*
	// 결제 담기
	int addPayment(CartVO payment); 
	
	// 결제 리스트
	List<PaymentVO> buyList(String userId);
	
	// 결제 리스트 삭제
	int deletePayment(PaymentVO payment);
	*/
}
