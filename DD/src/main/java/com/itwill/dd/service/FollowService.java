package com.itwill.dd.service;

public interface FollowService {
	boolean checkFollow(String followid, String followerid);

	boolean addFollow(String followid, String followerid);

	boolean deleteFollow(String followid, String followerid);
}
