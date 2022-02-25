package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.Board;
import com.itwill.dd.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired private BoardDao boardDao;

	@Override
	public List<Board> select(String userid) {
		log.info("select() 호출");

		return boardDao.read(userid);
	}
	
	@Override
	public int insert(Board board) {
		log.info("insert({}) 호출", board);
				
		return boardDao.create(board);
	}
	
	@Override
	public Board select(int bno) {
		log.info("select({}) 호출", bno);
		
		Board board = boardDao.read(bno);
		boardDao.updateViewCnt(bno);
		
		return boardDao.read(bno);
	}
	
	@Override
	public int update(Board board) {
		log.info("update({}) 호출", board);
		return boardDao.update(board);
	}
	
	@Override
	public int delete(int bno) {
		log.info("update({}) 호출", bno);
		return boardDao.delete(bno);
	}
	
	@Override
	public List<Board> select(int searchType, String searchKeyword, String userid) {
		log.info("select(searchType={},searchKeyword={}) 호출", searchType, searchKeyword);
		return boardDao.read(searchType, searchKeyword, userid);
	}
}