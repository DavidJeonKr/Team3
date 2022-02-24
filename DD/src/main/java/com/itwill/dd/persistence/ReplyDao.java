package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Reply;

public interface ReplyDao {
	int create(Reply reply);
	List<Reply> read(int bno);
	int update(Reply reply);
	int delete(int cno);
	int readBno(int cno);
		
}
