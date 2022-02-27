package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;
import com.itwill.dd.domain.PaymentProductList;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.User;

public interface ShopDao {
	
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
	
	// 결제 상품
	int paymentProduct(CartVO cart);
	
	// 결제 상품 리스트	
	List<PaymentProductList> paymentProductList(String userId);
	
	// 결제 돈
	int updateViscuit(String userId);
	
	// 결제 리스트 삭제
	int deletePayment(PaymentProductList payment);

	/*
	// 결제 담기
	int addPayment(CartVO payment);
	
	// 결제 리스트
	List<PaymentVO> buyList(String userId);

	
	
	int updateViscuit(CartVO payment);
	*/
}
