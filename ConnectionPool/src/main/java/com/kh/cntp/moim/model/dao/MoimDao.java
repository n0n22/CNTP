package com.kh.cntp.moim.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Team;
import com.kh.cntp.moim.model.vo.TeamMember;

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
	
	public Team SelectTeam(SqlSessionTemplate sqlSession, String teamNo) {
		return sqlSession.selectOne("moimMapper.selectTeam", teamNo);
	}
	
	public ArrayList<TeamMember> selectTeamMemberList(SqlSessionTemplate sqlSession, String teamNo) {
		return (ArrayList)sqlSession.selectList("moimMapper.selectTeamMeberList", teamNo);
	}
	
	public ArrayList<Apply> selectApplyList(SqlSessionTemplate sqlSession, String moimNo){
		return (ArrayList)sqlSession.selectList("moimMapper.selectApplyList", moimNo);
	}
	
	public ResultHistory selectResultHistory(SqlSessionTemplate sqlSession, String teamNo) {
		return sqlSession.selectOne("moimMapper.selectResultHistory", teamNo);
	}
	
	public Apply ajaxSelectApply(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("moimMapper.ajaxSelectApply", memNo);
	}
	
	public int updateTeam(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.update("moimMapper.updateTeam", team);
	}

}
