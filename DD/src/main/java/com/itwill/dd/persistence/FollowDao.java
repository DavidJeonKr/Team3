package com.itwill.dd.persistence;

import com.itwill.dd.domain.Follow;

public interface FollowDao {
	Follow getFollow(String followid, String followerid);

	int addFollow(String followid, String followerid);

	int deleteFollow(String followid, String followerid);
}
