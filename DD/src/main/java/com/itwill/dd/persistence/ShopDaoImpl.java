package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.CartListVO;
import com.itwill.dd.domain.CartVO;

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

}
