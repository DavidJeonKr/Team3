package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.Reply;

public interface ReplyService {
	List<Reply> select(int bno);
	int insert(Reply reply);
	int update(Reply reply);
	int delete(int cno);
}
