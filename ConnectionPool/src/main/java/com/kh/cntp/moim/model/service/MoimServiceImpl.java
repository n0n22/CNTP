package com.kh.cntp.moim.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.dao.MoimDao;
import com.kh.cntp.moim.model.vo.Apply;
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

	// 뭔가 이거 안 쓰게 될 거 같다.
	@Override
	public int insertTeamMember(TeamMember teamMember) {
		return 0;
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
	public int insertApply(Team team) {
		return 0;
	}

	@Override
	public int ajaxUpdateApply(int applyNo) {
		return 0;
	}

	@Override
	public int ajaxDeleteApply(int applyNo) {
		return 0;
	}

	@Override
	public int updateTeam(Team team) {
		return moimDao.updateTeam(sqlSession, team);
	}

	@Override
	public int updateTeamMember(String teamNo) {
		return 0;
	}

	@Override
	public int deleteTeamMember(int memNo) {
		return 0;
	}

	@Override
	public int updateTeamBadgeStatus(Team team) {
		return moimDao.updateTeamBadgeStatus(sqlSession, team);
	}

	@Override
	public ArrayList<Team> selectTeamList(Team team) {
		return null;
	}

	@Override
	public int selectTeamCountList(Team team) {
		return 0;
	}

	

	
	

}
