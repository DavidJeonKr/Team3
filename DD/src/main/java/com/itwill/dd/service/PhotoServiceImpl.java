package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.dd.domain.Photo;
import com.itwill.dd.persistence.PhotoDao;

import oracle.net.aso.m;

@Service
public class PhotoServiceImpl implements PhotoService {
	private static final Logger log = LoggerFactory.getLogger(PhotoServiceImpl.class);
	
	@Autowired
	private PhotoDao photoDao;
	
	@Override
	public int insert(MultipartFile file, String userid, String content) {
		// TODO Auto-generated method stub
		log.info("PhtoServiceImpl.insert() 호출");
		return photoDao.create(file, userid, content);
	}

	@Override
	public int insert(Photo photo) {
		log.info("PhtoServiceImpl.insert() 호출");
		return photoDao.create(photo);
	}

	@Override
	public List<Photo> selectall(String userid) {
		log.info("PhotoServiceImpl.selectall() 호출");
		return photoDao.selectall(userid);
	}

	@Override
	public int delete(int ptno) {
		log.info("PhotoServiceImpl.delete({}) 호출", ptno);
		return photoDao.delete(ptno);
	}



}
