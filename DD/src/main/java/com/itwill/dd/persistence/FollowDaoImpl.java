package com.itwill.dd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dd.domain.Follow;

@Repository
public class FollowDaoImpl implements FollowDao{
	private static final Logger log = LoggerFactory.getLogger(FollowDaoImpl.class);
	private static final String FOLLOW_NAMESPACE = "com.itwill.dd.mapper.FollowMapper";
	
	@Autowired SqlSession sqlSession;

	@Override
	public Follow getFollow(String followid, String followerid) {
		Map<String, Object> params = new HashMap<>();
		params.put("followid", followid);
		params.put("followerid", followerid);
		return sqlSession.selectOne(FOLLOW_NAMESPACE + ".checkFollow", params);
	}

	@Override
	public int addFollow(String followid, String followerid) {
		Map<String, Object> params = new HashMap<>();
		params.put("followid", followid);
		params.put("followerid", followerid);
		return sqlSession.insert(FOLLOW_NAMESPACE + ".add", params);
	}

	@Override
	public int deleteFollow(String followid, String followerid) {
		Map<String, Object> params = new HashMap<>();
		params.put("followid", followid);
		params.put("followerid", followerid);
		return sqlSession.delete(FOLLOW_NAMESPACE + ".delete", params);
	}

	@Override
	public List<Follow> followList(String followid) {
		return sqlSession.selectList(FOLLOW_NAMESPACE + ".followList", followid);
	}

	@Override
	public List<Follow> followerList(String followerid) {
		return sqlSession.selectList(FOLLOW_NAMESPACE + ".followerList", followerid);
	}

}
