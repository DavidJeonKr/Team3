package com.itwill.dd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dd.domain.Follow;
import com.itwill.dd.persistence.FollowDao;



@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired FollowDao followDao;
	@Override
	public boolean checkFollow(String followid, String followerid) {
		Follow followCk =  followDao.getFollow(followid, followerid);
		if(followCk == null) {
			return false;
		}else {
			return true;
		}
		
	}
	@Override
	public boolean addFollow(String followid, String followerid) {
		int addFol = followDao.addFollow(followid, followerid);
		if(addFol == 1) {
			return true;
		}else {
			return false;
		}
		
		
	}
	@Override
	public boolean deleteFollow(String followid, String followerid) {
		int deleteFol = followDao.deleteFollow(followid, followerid);
		if(deleteFol == 1) {
			return true;
		}else {
			return false;
		}
	
		
	}
	
}
