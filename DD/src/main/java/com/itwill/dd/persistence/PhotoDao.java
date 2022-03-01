package com.itwill.dd.persistence;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.dd.domain.Photo;


public interface PhotoDao {
	
	int create(MultipartFile file, String userid, String content);
	int create(Photo photo);
//	List<Photo> selectall();
	List<Photo> selectall(String userid);
	int delete(int ptno);
	
	
}
