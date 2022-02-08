package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Board;

public interface BoardDao {
	
	List<Board> read();
}
