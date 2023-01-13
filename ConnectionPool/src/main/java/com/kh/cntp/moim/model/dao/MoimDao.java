package com.kh.cntp.moim.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Chatting;
import com.kh.cntp.moim.model.vo.Group;
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
	
	public int selectTeamCountList(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.selectOne("moimMapper.selectTeamCountList", team);
	}
	
	public ArrayList<Team> selectTeamList(SqlSessionTemplate sqlSession, PageInfo pi, Team team) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("moimMapper.selectTeamList", team, rowBounds);
	}
	
	public ArrayList<Chatting> selectChattingList(SqlSessionTemplate sqlSession, Chatting chat){
		
		return (ArrayList)sqlSession.selectList("moimMapper.selectChattingList", chat);
	}
	
	public int ajaxInsertChatting(SqlSessionTemplate sqlSession, Chatting chat) {
		return sqlSession.insert("moimMapper.ajaxInsertChatting", chat);
	}
	
	public int ajaxDeleteChatting(SqlSessionTemplate sqlSession, String chatNo) {
		return sqlSession.delete("moimMapper.ajaxDeleteChatting", chatNo);
	}
	
	public int selectGroupCountList(SqlSessionTemplate sqlSession, Group group) {
		return sqlSession.selectOne("moimMapper.selectGroupCountList", group);
	}
	
	public ArrayList<Group> selectGroupList(SqlSessionTemplate sqlSession, Group group, PageInfo pi){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("moimMapper.selectGroupList", group, rowBounds);
	}
	
	public Group selectGroup(SqlSessionTemplate sqlSession, String groupNo) {
		return sqlSession.selectOne("moimMapper.selectGroup", groupNo);
	}

}
