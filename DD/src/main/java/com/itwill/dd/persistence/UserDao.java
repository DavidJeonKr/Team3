package com.itwill.dd.persistence;

import java.util.List;

import com.itwill.dd.domain.User;

public interface UserDao {
	int create(User user);
	User read(User user);
	User checkUserEmail(String userid);
	int updatePass(String userid, String password);
	int updateUserInfo(User user);
	int deleteUser(String userid);
	List<User> getSearch(String search);
	int addFollow(String followid);
	int addFollower(String followerid);
	int deleteFollow(String followid);
	int deleteFollower(String followerid);
	
}
