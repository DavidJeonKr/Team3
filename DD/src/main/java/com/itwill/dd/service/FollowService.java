package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.Follow;

public interface FollowService {
	boolean checkFollow(String followid, String followerid);

	boolean addFollow(String followid, String followerid);

	boolean deleteFollow(String followid, String followerid);

	List<Follow> followList(String followid);

	List<Follow> followerList(String followerid);
}
