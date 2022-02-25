package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.Board;

public interface BoardService {

	List<Board> select(String userid);
	int insert(Board board);
	Board select(int bno);
	int update(Board board);
	int delete(int bno);
	List<Board> select(int searchType, String searchKeyword, String userid);
}