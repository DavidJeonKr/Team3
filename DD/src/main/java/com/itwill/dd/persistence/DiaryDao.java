package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Diary;

// CRUD 기능
public interface DiaryDao {
	
	List<Diary> read();
	
	//	List<Diary> read(String userid);
	
	Diary read(int dno);	
	
	int create(Diary diary);
	
	int update(Diary diary);
	
	int delete(int dno);
	
}
