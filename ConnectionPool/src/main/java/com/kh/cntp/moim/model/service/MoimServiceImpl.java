package com.kh.cntp.moim.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public String ajaxSelectTeam(String checkName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTeam(Team team) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTeamMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertResultHistory(int teamNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Team selectTeam(int teamNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TeamMember selectTeamMember(int teamNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Apply selectApply(int moimNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertApply(Team team) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ajaxUpdateApply(int applyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ajaxDeleteApply(int applyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTeam(int teamNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTeamMember(int teamNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTeamMember(int memNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
