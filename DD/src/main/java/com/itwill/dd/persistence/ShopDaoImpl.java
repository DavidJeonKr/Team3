package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;
import com.itwill.dd.domain.PaymentProductList;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.User;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sql;
	
	private static final String NAMESPACE = "com.itwill.dd.mapper.ShopMapper";
	
	// 카트 담기
	@Override
	public int addCart(CartVO cart) {
		
		return sql.insert(NAMESPACE + ".addCart", cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) {

		return sql.selectList(NAMESPACE + ".cartList", userId);
	}

	// 카트 삭제
	@Override
	public int deleteCart(CartVO cart) {

		return sql.delete(NAMESPACE + ".deleteCart", cart);
	}

	// 검색
	@Override
	public List<ProductVO> search(String keyword) {
		
		keyword = "%" + keyword + "%";
		
		return sql.selectList(NAMESPACE + ".search", keyword);
	}

	// 음악 리스트
	@Override
	public List<ProductVO> musicList() {
		
		return sql.selectList(NAMESPACE +".musicList");
	}

	// 결제 상품
	@Override
	public int paymentProduct(CartVO cart) {

		return sql.insert(NAMESPACE + ".paymentProduct", cart);
	}

	// 결제 돈
	@Override
	public int updateViscuit(String userId) {
		
		return sql.update(NAMESPACE + ".updateViscuit", userId);
	}

	// 결제 상품 리스트
	@Override
	public List<PaymentProductList> paymentProductList(String userId) {
		
		return sql.selectList(NAMESPACE + ".paymentProductList", userId);
	}

	// 결제 리스트 삭제
	@Override
	public int deletePayment(PaymentProductList payment) {
		
		return sql.delete(NAMESPACE + ".deletePayment", payment);
	}


	

	/*
	// 결제 담기
	@Override
	public int addPayment(CartVO payment) {
		
		return sql.insert(NAMESPACE + ".paymentProduct", payment);
	}

	// 결제 리스트
	@Override
	public List<PaymentVO> buyList(String userId) {

		return sql.selectList(NAMESPACE + ".buyList", userId);
	}

	// 결제 리스트 삭제
	@Override
	public int deletePayment(PaymentVO payment) {

		return sql.delete(NAMESPACE + ".deletePayment", payment);
	} */	

}
