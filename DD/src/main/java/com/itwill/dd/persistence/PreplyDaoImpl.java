package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Photo;
import com.itwill.dd.domain.Preply;

@Repository
public class PreplyDaoImpl implements PreplyDao {
	private static final Logger log = LoggerFactory.getLogger(PreplyDaoImpl.class);
	private static final String NAMESPACE = "com.itwill.dd.mapper.PreplyMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int create(Preply preply) {
		log.info("create({})", preply);
		return sqlSession.insert(NAMESPACE+ ".insert", preply);
	}
	@Override
	public List<Preply> read(int ptno) {
		log.info("read 호출 (ptno: {})", ptno);
		return sqlSession.selectList(NAMESPACE + ".select", ptno);
	}
	
	public List<Photo> readphoto(int ptno) {
		log.info("readptno 호출 (ptno: {})", ptno);
		return sqlSession.selectList(NAMESPACE + "select_by_photo", ptno);
	}
	

}
