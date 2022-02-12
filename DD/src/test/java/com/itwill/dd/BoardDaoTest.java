package com.itwill.dd;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.itwill.dd.domain.Board;
import com.itwill.dd.persistence.BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class BoardDaoTest {
	private static final Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);
	

	@Autowired private BoardDao boardDao;
	
	@Test
	public void doTest() {
		logger.info("boardDao: {}", boardDao);
		
//		List<Board> list = boardDao.read();
//		logger.info("list size = {}", list.size());
		
//		Board board = boardDao.read(7);
//		logger.info(board.toString());
		
//		Board board = new Board(0, "MyBatis-Spring Test", "마이바티스 스프링 테스트", null, 0, 0, null, "admin"); 
//		int result = boardDao.create(board);
//		logger.info("INSERT 결과: {}", result);
		
//		Board board = new Board(21, "수정해보기", "수정이 되는지", null, 0, 0, null, null);
//		int result = boardDao.update(board);
//		logger.info("UPDATE 결과: {}", result);

//		int result = boardDao.updateViewCnt(21);
//		logger.info("updateViewCnt 결과: {}", result);
		
//		int result = boardDao.updateLikeCnt(21);
//		logger.info("updateLikeCnt 결과: {}", result);
		
//		int result = boardDao.delete(21);
//		logger.info("delete 결과: {}", result);
		
//		List<Board> list = boardDao.read(1, "테스");
//		logger.info("키워드 검색 결과: {}개 행", list.size());
		
	}
}
