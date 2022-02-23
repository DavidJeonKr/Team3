package com.itwill.dd.service;

import java.util.List;

import com.itwill.dd.domain.User;

public interface UserService {
	
	int registerNewUser(User user);
	
	User checkSignIn(User user);
	
	boolean isValidEmail(String userid);
	
	int updatePass(String userid, String password);
	
	User userInfo(String userid);
	
	int updateUserInfo(User user);
	
	int deleteUserInf(String userid);

	List<User> getSearchVal(String search);

	boolean passCheck(String userid, String pass);

	
}
