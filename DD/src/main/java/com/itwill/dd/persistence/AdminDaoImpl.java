package com.itwill.dd.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.CategoryVO;
import com.itwill.dd.domain.ProductVO;
import com.itwill.dd.domain.ProductViewVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	private static final String NAMESPACE = "com.itwill.dd.mapper.AdminMapper";

	private static final Logger log = LoggerFactory.getLogger(AdminDaoImpl.class);
	
	@Autowired
	private SqlSession sql;
	
	// 카테고리
	@Override
	public List<CategoryVO> category() {
		log.info("category 호출");
		return sql.selectList(NAMESPACE + ".category");
	}
	
	// 상품 등록
	@Override
	public int register(ProductVO product) {
		log.info("registerDao 호출");
		return sql.insert(NAMESPACE + ".register", product);
	}

	// 상품 목록
	@Override
	public List<ProductViewVO> goodsList() {
		log.info("goodsListDao 호출");
		return sql.selectList(NAMESPACE + ".goodsList");
	}

	// 상품 조회
	@Override
	public ProductViewVO productDetail(int productId) {
		log.info("goodsDetailDao 호출");
		return sql.selectOne(NAMESPACE + ".goodsDetail", productId);
	}

	// 상품 수정
	@Override
	public int productUpdate(ProductVO product) {
		log.info("productUpdate 호출");
		return sql.update(NAMESPACE + ".goodsUpdate", product);
	}

	
	// 상품 삭제
	@Override
	public int productDelete(int productId) {
		log.info("productDelete 호출");
		return sql.delete(NAMESPACE + ".goodsDelete", productId);
	}



}
