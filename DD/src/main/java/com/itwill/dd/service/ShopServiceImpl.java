package com.itwill.dd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;

import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.persistence.ShopDao;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	// 카트 담기
	@Override
	public int addCart(CartVO cart) {
		
		return shopDao.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) {
		
		return shopDao.cartList(userId);
	}

	// 카트 삭제
	@Override
	public int deleteCart(CartVO cart) {
		
		return shopDao.deleteCart(cart);
	}

	// 검색
	@Override
	public List<ProductVO> search(String keyword) {
		
		return shopDao.search(keyword);
	}

	// 음악 리스트
	@Override
	public List<ProductVO> musicList() {

		return shopDao.musicList();
	}
	
	/*
	// 결제
	@Override
	public int addPayment(CartVO payment) {
				
		shopDao.updateViscuit(payment);
		
		return shopDao.addPayment(payment);
	}

	// 결제 리스트
	@Override
	public List<PaymentVO> buyList(String userId) {

		return shopDao.buyList(userId);
	}

	// 결제 리스트 삭제
	@Override
	public int deletePayment(PaymentVO payment) {
		
		return shopDao.deletePayment(payment);
	}
	*/
}
