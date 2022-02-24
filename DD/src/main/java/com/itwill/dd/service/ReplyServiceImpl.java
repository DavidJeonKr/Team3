package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.Reply;
import com.itwill.dd.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {

	private static final Logger log = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	@Autowired private ReplyDao replyDao;
	
	@Override
	public List<Reply> select(int bno) {
		log.info("select(bno={})", bno);
		
		return replyDao.read(bno);
	}

	@Override
	public int insert(Reply reply) {
		// 댓글 테이블(replies)에 새로운 댓글 추가.
				int result = replyDao.create(reply);
				
				
				return result;
	}
	
	@Override
	public int update(Reply reply) {
		log.info("update({})", reply);
		
		return replyDao.update(reply);
	}
	
	@Override
	public int delete(int cno) {
		log.info("delete(cno={})", cno);
		
		// 댓글 번호가 cno인 댓글의 게시글 번호(bno)를 찾음.
		int bno = replyDao.readBno(cno);
		
		// 댓글 테이블(replies)에서 cno의 댓글 삭제.
		int result = replyDao.delete(cno);
		
		
		
		return result;
	}
}
