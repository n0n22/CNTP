package com.kh.cntp.moim.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.moim.model.vo.Team;

@Repository
public class MoimDao {
	
	public int ajaxSelectTeam(SqlSessionTemplate sqlSession, String checkName) {
		return sqlSession.selectOne("moimMapper.ajaxSelectTeam", checkName);
	}
	
	
	public int insertTeam(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.insert("moimMapper.insertTeam", team);
	}
	
	public int insertTeamLeaderMember(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.insert("moimMapper.insertTeamLeaderMember", team);
	}
	
	public int insertResultHistory(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("moimMapper.insertResultHistory");
	}

}
