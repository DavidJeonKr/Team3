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
	public List<Board> select() {
		log.info("select() 호출");

		return boardDao.read();
	}
	
	@Override
	public int insert(Board board) {
		log.info("insert({}) 호출", board);
				
		return boardDao.create(board);
	}
	
	@Override
	public Board select(int bno) {
		log.info("select({}) 호출", bno);
		return boardDao.read(bno);
	}
}
