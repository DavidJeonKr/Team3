package com.itwill.dd.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);
	private static final String USER_NAMESPACE = "com.itwill.dd.mapper.UserMapper";
	
	@Autowired SqlSession sqlSession;
	
	@Override
	public int create(User user) {
		
		return sqlSession.insert(USER_NAMESPACE + ".create", user);
	}

	@Override
	public User read(User user) {
		
		return sqlSession.selectOne(USER_NAMESPACE + ".selectByIdAndPwd", user);
	}

	@Override
	public User checkUserEmail(String userid) {
		return sqlSession.selectOne(USER_NAMESPACE + ".selectByEmail", userid);
	}

	@Override
	public int updatePass(String userid, String password) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("password", password);
		
		return sqlSession.update(USER_NAMESPACE + ".updatePass", params);
	}

	@Override
	public int updateUserInfo(User user) {
		log.info("{}",user);
		return sqlSession.update(USER_NAMESPACE + ".updateUser", user);
	}

	@Override
	public int deleteUser(String userid) {
		return sqlSession.delete(USER_NAMESPACE + ".deleteUser", userid);
	}

}
