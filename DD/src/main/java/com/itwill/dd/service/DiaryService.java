package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.Diary;


public interface DiaryService {
	List<Diary> select();
	
//	List<Diary> select(String userid);
	
	Diary select(int dno);
	
	int insert (Diary diary);
	
	int update (Diary diary);
	
	int delete (int dno);
}
