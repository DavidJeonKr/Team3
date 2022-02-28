package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.Preply;
import com.itwill.dd.persistence.PreplyDao;

@Service
public class PreplyServiceImpl implements PreplyService {
	
	private static final Logger log = LoggerFactory.getLogger(PreplyServiceImpl.class);

	@Autowired PreplyDao preplyDao;
	
	@Override
	public List<Preply> select(int ptno) {
		log.info("select(ptno={})", ptno);
		return preplyDao.read(ptno);
	}

	@Override
	public int insert(Preply preply) {
		int result = preplyDao.create(preply);
		return result;
	}


}
