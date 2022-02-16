package com.itwill.dd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Diary;

@Repository
public class DiaryDaoImpl implements DiaryDao{	
	private static final Logger log = LoggerFactory.getLogger(DiaryDaoImpl.class);
	private static final String DIARY_NAMESPACE = "com.itwill.dd.mapper.DiaryMapper";
	
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public List<Diary> read() {
		log.info("diaryDaoImpl.read() 호출");
		return sqlSession.selectList(DIARY_NAMESPACE + ".selectAll");
	}
	
//	@Override
//	public List<Diary> read(String userid) {
//		log.info("diaryDaoImpl.read() 호출");		
//		return sqlSession.selectList(DIARY_NAMESPACE + ".selectAll");
//		
//	}

	@Override
	public Diary read(int dno) {
		log.info("diaryDaoImpl.read(dno={}) 호출", dno);
		return sqlSession.selectOne(DIARY_NAMESPACE + ".selectByDno", dno);
	}

	@Override
	public int create(Diary diary) {
		log.info("diaryDaoImpl.create({}) 호출", diary);
		return sqlSession.insert(DIARY_NAMESPACE +".create", diary);
	}

	@Override
	public int update(Diary diary) {
		log.info("diaryDaoImpl.update({}) 호출", diary);
		return sqlSession.update(DIARY_NAMESPACE +".update", diary);
	}

	@Override
	public int delete(int dno) {
		log.info("diaryDaoImpl.delete({}) 호출", dno);
		return sqlSession.delete(DIARY_NAMESPACE +".delete", dno);
	}

}
