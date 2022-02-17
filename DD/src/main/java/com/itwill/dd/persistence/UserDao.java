package com.itwill.dd.persistence;

import com.itwill.dd.domain.User;

public interface UserDao {
	int create(User user);
	User read(User user);
	User checkUserEmail(String userid);
	int updatePass(String userid, String password);
}
