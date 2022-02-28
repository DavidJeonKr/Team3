package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.Preply;

public interface PreplyService {
	
	List<Preply> select(int ptno);
	int insert(Preply preply);
	
	
}
