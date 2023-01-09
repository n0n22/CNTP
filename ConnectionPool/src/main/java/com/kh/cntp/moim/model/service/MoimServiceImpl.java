package com.kh.cntp.moim.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int insertTeamMember(TeamMember teamMember) {
		return 0;
	}


	@Override
	public Team selectTeam(int teamNo) {
		return null;
	}

	@Override
	public TeamMember selectTeamMember(int teamNo) {
		return null;
	}

	@Override
	public Apply selectApply(int moimNo) {
		return null;
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
	public int updateTeam(int teamNo) {
		return 0;
	}

	@Override
	public int updateTeamMember(int teamNo) {
		return 0;
	}

	@Override
	public int deleteTeamMember(int memNo) {
		return 0;
	}

	@Override
	public int updateTeamBadge(int teamNo) {
		return 0;
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
