package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.Follow;

public interface FollowDao {
	Follow getFollow(String followid, String followerid);

	int addFollow(String followid, String followerid);

	int deleteFollow(String followid, String followerid);

	List<Follow> followList(String followid);

	List<Follow> followerList(String followerid);
}
