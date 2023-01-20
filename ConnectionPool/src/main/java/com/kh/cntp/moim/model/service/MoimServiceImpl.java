package com.kh.cntp.moim.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
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
	
	// 팀 기능
	@Override
	public int selectTeamCountList(Team team) {
		return moimDao.selectTeamCountList(sqlSession, team);
	}

	@Override
	public ArrayList<Team> selectTeamList(PageInfo pi, Team team) {
		return moimDao.selectTeamList(sqlSession, pi, team);
	}
	
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
	public Apply ajaxSelectApply(Apply ap) {
		return moimDao.ajaxSelectApply(sqlSession, ap);
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
		
		// 리더와 부리더 등급 변경 리더만 있다면 한번만, 부리더도 있다면 두번 요청 보냄
		for(TeamMember tm : teamMemberList) {
			result *= moimDao.updateTeamMember(sqlSession, tm);
		}
		
		// 2~3번의 요청 결과를 곱하여 성공 여부를 return
		return  result;
	}
	
	@Override
	public int updateTeamBadgeStatus(Team team) {
		return moimDao.updateTeamBadgeStatus(sqlSession, team);
	}
	
	@Transactional
	@Override
	public int deleteTeamMember(TeamMember tm) {
		return moimDao.deleteTeamMember(sqlSession, tm.getMemNo());
	}
	
	@Override
	public int insertApply(Apply ap) {
		return moimDao.insertApply(sqlSession, ap);
	}

	@Override
	public int insertTeamMember(TeamMember tm, Apply ap) {
		return moimDao.insertTeamMember(sqlSession, tm)*moimDao.deleteApply(sqlSession, ap);
	}
	
	@Override
	public int deleteApply(Apply ap) {
		return moimDao.deleteApply(sqlSession, ap);
	}

	// 채팅 기능
	@Override
	public ArrayList<Member> selectAcceptMember(String groupNo) {
		return moimDao.selectAcceptMember(sqlSession, groupNo);
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
	
	// 소그룹 기능
	@Override
	public int selectGroupCountList(Group group) {
		return moimDao.selectGroupCountList(sqlSession, group);
	}
	
	@Override
	public ArrayList<Group> selectGroupList(PageInfo pi, Group group) {
		return moimDao.selectGroupList(sqlSession, group, pi);
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
	public ArrayList<Apply> selectGroupApplyList(String moimNo) {
		return moimDao.selectGroupApplyList(sqlSession, moimNo);
	}
	
	@Override
	public int updateGroup(Group group) {
		return moimDao.updateGroup(sqlSession, group);
	}
	
	@Override
	public int updateApply(Apply ap) {
		return moimDao.updateApply(sqlSession, ap);
	}

	@Override
	public int deleteGroup(Group group) {
		return moimDao.deleteGroup(sqlSession, group);
	}

}
