package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	private static final Logger log = LoggerFactory.getLogger(BoardDaoImpl.class);
	private static final String BOARD_NAMESPACE = "com.itwill.dd.mapper.BoardMapper";
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public List<Board> read() {
		log.info("BoardDaoImpl.read() 호출");
		return sqlSession.selectList(BOARD_NAMESPACE + ".selectAll");
	}

}
