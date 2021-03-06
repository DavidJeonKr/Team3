package com.itwill.dd.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.User;
import com.itwill.dd.persistence.UserDao;

@Service
public class UserServiceImpl implements UserService{
	
	private static final Logger log = LoggerFactory.getLogger(UserService.class);
	
	@Autowired UserDao userDao;
	@Autowired private BCryptPasswordEncoder passEncoder;
	
	@Override
	public int registerNewUser(User user) {
		String pwd = passEncoder.encode(user.getPassword());
		user.setPassword(pwd);
		return userDao.create(user);
	}

	@Override
	public User checkSignIn(User user) {
		
		if(
			passEncoder.matches(
					user.getPassword(), 
					userDao.checkUserEmail(user.getUserid()).getPassword())) {
			return userDao.checkUserEmail(user.getUserid());
		}else {
			return null;
		}
		
		
	}

	@Override
	public boolean isValidEmail(String userid) {
		User user = userDao.checkUserEmail(userid);
		if(user == null) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public int updatePass(String userid, String password) {
		String pwd = passEncoder.encode(password);
		return userDao.updatePass(userid, pwd);
	}

	@Override
	public User userInfo(String userid) {
		
		return userDao.checkUserEmail(userid);
	}

	@Override
	public int updateUserInfo(User user) {
		
		return userDao.updateUserInfo(user);
	}

	@Override
	public int deleteUserInf(String userid) {
		return userDao.deleteUser(userid);
	}

	@Override
	public List<User> getSearchVal(String search) {
		
		return userDao.getSearch(search);
	}

	@Override
	public boolean passCheck(String userid, String pass) {
		
		return passEncoder.matches(pass, userDao.checkUserEmail(userid).getPassword());
	}

	

}
