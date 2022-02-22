package com.itwill.dd.service;

import com.itwill.dd.domain.User;

public interface UserService {
	
	int registerNewUser(User user);
	
	User checkSignIn(User user);
	
	boolean isValidEmail(String userid);
	
	int updatePass(String userid, String password);
	
	User userInfo(String userid);
}
