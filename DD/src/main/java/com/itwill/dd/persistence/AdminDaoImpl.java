package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.ProductVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	private static final String NAMESPACE = "com.itwill.dd.mapper.AdminMapper";

	private static final Logger log = LoggerFactory.getLogger(AdminDaoImpl.class);
	
	@Autowired
	private SqlSession sql;
	
	// 상품 등록
	@Override
	public int register(ProductVO product) {
		log.info("register 호출");
		return sql.insert(NAMESPACE + ".register", product);
	}

	// 상품 목록
	@Override
	public List<ProductVO> goodsList() {
		log.info("goodsList 호출");
		return sql.selectList(NAMESPACE + ".goodsList");
	}

}
