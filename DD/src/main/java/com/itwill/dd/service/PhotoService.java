package com.itwill.dd.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.dd.domain.Photo;



public interface PhotoService {
	int insert(MultipartFile file, String userid, String content);
	int insert(Photo photo);
	List<Photo> selectall(String userid);
}
