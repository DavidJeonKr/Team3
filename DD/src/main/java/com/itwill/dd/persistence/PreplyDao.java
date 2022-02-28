package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Photo;
import com.itwill.dd.domain.Preply;

public interface PreplyDao {


	int create(Preply preplies);
	
	List<Preply> read(int ptno);
	
	List<Photo> readphoto(int ptno);
	
}
