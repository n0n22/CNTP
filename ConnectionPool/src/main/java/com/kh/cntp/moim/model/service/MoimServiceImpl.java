package com.kh.cntp.moim.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.moim.model.dao.MoimDao;
import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Chatting;
import com.kh.cntp.moim.model.vo.Group;
import com.kh.cntp.moim.model.vo.Team;
import com.kh.cntp.moim.model.vo.TeamMember;

@Service
public class MoimServiceImpl implements MoimService {
	
	@Autowired
	private MoimDao moimDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int ajaxSelectTeam(String checkName) {
		return moimDao.ajaxSelectTeam(sqlSession, checkName);
	}

	@Override
	@Transactional
	public int insertTeam(Team team) {
		//return 할 때 곱하기로 해주면 된다 !
		return moimDao.insertTeam(sqlSession, team)*moimDao.insertTeamLeaderMember(sqlSession, team)*moimDao.insertResultHistory(sqlSession);
	}

	@Override
	public Team selectTeam(String teamNo) {
		return moimDao.SelectTeam(sqlSession, teamNo);
	}

	@Override
	public ArrayList<TeamMember> selectTeamMemberList(String teamNo) {
		return moimDao.selectTeamMemberList(sqlSession, teamNo);
	}

	@Override
	public ArrayList<Apply> selectApplyList(String moimNo) {
		return moimDao.selectApplyList(sqlSession, moimNo);
	}
	
	@Override
	public ResultHistory seletResultHistory(String teamNo) {
		return moimDao.selectResultHistory(sqlSession, teamNo);
	}
	
	@Override
	public Apply ajaxSelectApply(int memNo) {
		return moimDao.ajaxSelectApply(sqlSession, memNo);
	}

	@Override
	public int insertApply(Apply ap) {
		return moimDao.insertApply(sqlSession, ap);
	}

	@Transactional
	@Override
	public int updateApply(Apply ap) {
		return moimDao.updateApply(sqlSession, ap.getApplyNo()) * moimDao.insertTeamMember(sqlSession, ap);
	}
	
	@Override
	public int updateGroupApply(int applyNo) {
		return moimDao.updateApply(sqlSession, applyNo);
	}

	@Override
	public int deleteApply(int memNo) {
		return moimDao.deleteApply(sqlSession, memNo);
	}

	@Override
	public int updateTeam(Team team) {
		return moimDao.updateTeam(sqlSession, team);
	}

	@Transactional
	@Override
	public int updateTeamMember(ArrayList<TeamMember> teamMemberList) {
				// 해당 팀의 모든 팀원의 등급을 "M"으로 바꿈
		int result = moimDao.updateTeamMemberGradeM(sqlSession, teamMemberList.get(0).getTeamNo());
		for(TeamMember tm : teamMemberList) {
			result *= moimDao.updateTeamMember(sqlSession, tm);
		}
		return  result;
	}

	@Transactional
	@Override
	public int deleteTeamMember(int memNo) {
		return moimDao.deleteTeamMember(sqlSession, memNo) * moimDao.deleteApply(sqlSession, memNo);
	}

	@Override
	public int updateTeamBadgeStatus(Team team) {
		return moimDao.updateTeamBadgeStatus(sqlSession, team);
	}

	@Override
	public int selectTeamCountList(Team team) {
		return moimDao.selectTeamCountList(sqlSession, team);
	}

	@Override
	public ArrayList<Team> selectTeamList(PageInfo pi, Team team) {
		return moimDao.selectTeamList(sqlSession, pi, team);
	}

	@Override
	public ArrayList<Chatting> selectChattingList(Chatting chat) {
		return moimDao.selectChattingList(sqlSession, chat);
	}

	@Override
	public int ajaxInsertChatting(Chatting chat) {
		// TODO Auto-generated method stub
		return moimDao.ajaxInsertChatting(sqlSession, chat);
	}

	@Override
	public int ajaxDeleteChatting(String chatNo) {
		return moimDao.ajaxDeleteChatting(sqlSession, chatNo);
	}

	@Override
	public ArrayList<Group> selectGroupList(PageInfo pi, Group group) {
		return moimDao.selectGroupList(sqlSession, group, pi);
	}

	@Override
	public int selectGroupCountList(Group group) {
		return moimDao.selectGroupCountList(sqlSession, group);
	}

	@Override
	public int insertGroup(Group group) {
		return moimDao.insertGroup(sqlSession, group);
	}

	@Override
	public Group selectGroup(String groupNo) {
		return moimDao.selectGroup(sqlSession, groupNo);
	}

	@Override
	public int updateGroup(Group group) {
		return moimDao.updateGroup(sqlSession, group);
	}

	@Override
	public int deleteGroup(Group group) {
		return moimDao.deleteGroup(sqlSession, group);
	}

	@Override
	public Apply ajaxSelectGroupApply(Apply ap) {
		return moimDao.ajaxSelectGroupApply(sqlSession, ap);
	}

	@Override
	public ArrayList<Apply> selectGroupApplyList(String moimNo) {
		return moimDao.selectGroupApplyList(sqlSession, moimNo);
	}

	

	
	

}
