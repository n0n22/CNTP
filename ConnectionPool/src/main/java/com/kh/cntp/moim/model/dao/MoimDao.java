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
	

}
