package com.itwill.dd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(BoardDaoImpl.class);
	private static final String BOARD_NAMESPACE = "com.itwill.dd.mapper.BoardMapper";
	private static final String REPLY_NAMESPACE = "com.itwill.dd.mapper.ReplyMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Board> read() {
		logger.info("BoardDaoImpl.read() 호출");
		return sqlSession.selectList(BOARD_NAMESPACE + ".selectAll");
	}

	@Override
	public Board read(int bno) {
		logger.info("boardDaoImpl.read(bno={}) 호출", bno);

		return sqlSession.selectOne(BOARD_NAMESPACE + ".selectByBno", bno);
	}

	@Override
	public int create(Board board) {
		logger.info("boardDaoImpl.create({}) 호출", board);

		return sqlSession.insert(BOARD_NAMESPACE + ".create", board);
	}

	@Override
	public int update(Board board) {
		logger.info("boardDaoImpl.update({}) 호출", board);

		return sqlSession.update(BOARD_NAMESPACE + ".update", board);
	}

	@Override
	public int updateViewCnt(int bno) {
		logger.info("boardDaoImpl.updateViewCnt(bno={}) 호출", bno);

		return sqlSession.update(BOARD_NAMESPACE + ".updateViewCnt", bno);
	}

	@Override
	public int updateLikeCnt(int bno) {
		logger.info("boardDaoImpl.updateLikeCnt(bno={}) 호출", bno);

		return sqlSession.update(BOARD_NAMESPACE + ".updateLikeCnt", bno);
	}

	@Override
	public int delete(int bno) {
		logger.info("boardDaoImpl.delete(bno={})", bno);
		sqlSession.delete(REPLY_NAMESPACE + ".deleteAllReply", bno);
		return sqlSession.delete(BOARD_NAMESPACE + ".delete", bno);
	}

	@Override
	public List<Board> read(int type, String keyword) {
		logger.info("boardDaoImpl.read(type={}, keyword={})", type, keyword);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", "%" + keyword.toLowerCase() + "%");

		return sqlSession.selectList(BOARD_NAMESPACE + ".selectByKeyword", params);
	}

}
