package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.Diary;
import com.itwill.dd.persistence.DiaryDao;


@Service
public class DiaryServiceImpl implements DiaryService {
	private static final Logger log = LoggerFactory.getLogger(DiaryServiceImpl.class);
	
	@Autowired
	private DiaryDao diaryDao;

	@Override
	public List<Diary> select() {
		log.info("DiaryService select() 호출");
		return diaryDao.read();
	}
	
//	@Override
//	public List<Diary> select(String userid) {
//		log.info("DiaryService select(userid={}) 호출", userid);
//		return diaryDao.read(userid);
//	}

	@Override
	public Diary select(int dno) {
		log.info("DiaryService select(dno={}) 호출", dno);
		return diaryDao.read(dno);
	}

	@Override
	public int insert(Diary diary) {
		log.info("DiaryService insert({}) 호출", diary);
		int result = diaryDao.create(diary);
		return result;
	}

	@Override
	public int update(Diary diary) {
		log.info("DiaryService update({}) 호출", diary);
		int result = diaryDao.update(diary);
		return result;
	}

	@Override
	public int delete(int dno) {
		log.info("DiaryService delete(dno = {}) 호출", dno);
		int result = diaryDao.delete(dno);
		return result;
	}
	
}
