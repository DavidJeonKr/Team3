package com.itwill.dd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.dd.domain.Photo;

@Repository
public class PhotoDaoImpl implements PhotoDao {
	private static final Logger log = LoggerFactory.getLogger(PhotoDaoImpl.class);
	private static final String PHOTOS_NAMESPACE = "com.itwill.dd.mapper.PhotoMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int create(MultipartFile file, String userid, String content) {
		log.info("PhotoDaoImpl.create 호출");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("filename", file.getOriginalFilename());
		params.put("userid", userid);
		params.put("content", content);
		
		return sqlSession.insert(PHOTOS_NAMESPACE + ".create", params);
	}

	@Override
	public int create(Photo photo) {
		log.info("PhotoDaoImpl.create 호출");
		log.info("create-------------------{}",photo.toString());
		return sqlSession.insert(PHOTOS_NAMESPACE + ".create", photo);
	}

	@Override
	public List<Photo> selectall(String userid) {
		log.info("PhotoDaoImpl.selectall() 호출");
		return sqlSession.selectList(PHOTOS_NAMESPACE + ".selectall", userid);
	}

	@Override
	public int delete(int ptno) {
		log.info("PhotoDaoImpl.delete({}) 호출", ptno);
		return sqlSession.delete(PHOTOS_NAMESPACE + ".delete", ptno);
	}




}
