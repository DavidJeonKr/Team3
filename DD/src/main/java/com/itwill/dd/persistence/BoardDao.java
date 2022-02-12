package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Board;

public interface BoardDao {
	
	List<Board> read();
	Board read(int bno);
	int create(Board board);
	int update(Board board);
	int updateViewCnt(int bno);
	int updateLikeCnt(int bno);
	int delete(int bno);
	List<Board> read(int type, String keyword);
}
