package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	private static final Logger log = LoggerFactory.getLogger(BoardDaoImpl.class);
	private static final String REPLY_NAMESPACE = "com.itwill.dd.mapper.ReplyMapper";

	@Autowired  // 의존성 주입
	private SqlSession sqlSession;
	
	@Override
	public int create(Reply reply) {
		log.info("create({}) 호출", reply);
		
		return sqlSession.insert(REPLY_NAMESPACE + ".insert", reply);
	}

	@Override
	public List<Reply> read(int bno) {
		log.info("read(bno={}) 호출", bno);
		
		return sqlSession.selectList(REPLY_NAMESPACE + ".select", bno);
	}
	
	@Override
	public int update(Reply reply) {
		log.info("update({}) 호출", reply);
		
		return sqlSession.update(REPLY_NAMESPACE + ".update", reply);
	}
	
	@Override
	public int delete(int cno) {
		log.info("delete(cno={}) 호출", cno);
		
		return sqlSession.delete(REPLY_NAMESPACE + ".delete", cno);
	}
	
	@Override
	public int readBno(int cno) {
		log.info("readBno(cno={})", cno);
		
		return sqlSession.selectOne(REPLY_NAMESPACE + ".readBno", cno);
	}
}
