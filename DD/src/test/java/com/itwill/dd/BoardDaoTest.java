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
	private static final Logger log = LoggerFactory.getLogger(BoardDaoTest.class);
	

	@Autowired private BoardDao boardDao;
	
	@Test
	public void doTest() {
		log.info("boardDao: {}", boardDao);
		
		List<Board> list = boardDao.read();
		log.info("list size = {}", list.size());
	}
}
