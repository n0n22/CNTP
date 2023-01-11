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
	
	public int updateTeamBadgeStatus(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.update("moimMapper.updateTeamBadgeStatus", team);
	}
	
	public int updateTeamMemberGradeM(SqlSessionTemplate sqlSession, String teamNo) {
		return sqlSession.update("moimMapper.updateTeamMemberGradeM", teamNo);
	}
	
	public int updateTeamMember(SqlSessionTemplate sqlSession, TeamMember tm) {
		return sqlSession.update("moimMapper.updateTeamMember", tm);
	}
	
	public int deleteTeamMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.delete("moimMapper.deleteTeamMember", memNo);
	}
	
	public int deleteApply(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.delete("moimMapper.deleteApply", memNo);
	}
	
	public int insertApply(SqlSessionTemplate sqlSession, Apply ap) {
		return sqlSession.insert("moimMapper.insertApply", ap);
	}
	
	public int updateApply(SqlSessionTemplate sqlSession, int applyNo) {
		return sqlSession.update("moimMapper.updateApply", applyNo);
	}
	
	public int insertTeamMember(SqlSessionTemplate sqlSession, Apply ap) {
		return sqlSession.insert("moimMapper.insertTeamMember", ap);
	}

}
