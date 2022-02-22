package com.itwill.dd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;
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

}
