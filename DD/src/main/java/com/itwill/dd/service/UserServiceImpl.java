package com.itwill.dd.service;

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

}
