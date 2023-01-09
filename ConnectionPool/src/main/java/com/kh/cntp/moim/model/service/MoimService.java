package com.kh.cntp.moim.model.service;

import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Team;
import com.kh.cntp.moim.model.vo.TeamMember;

public interface MoimService {
	
	
	// --------------- 팀 등록 관련 메소드 (teamEnrollForm) ---------------
	
	// teamEnrollForm 페이지에서 비동기식으로 팀 이름 중복 체크
	String ajaxSelectTeam(String checkName);
	
	// 팀 등록
	int insertTeam(Team team);
	
	// 팀 등록 성공 시 팀장 insert, 후에 신청 수락 시에도 team_grade에 M 담아서 해당 메소드 사용
	int insertTeamMember(TeamMember teamMember);
	
	// 팀 등록 성공 시  + point 메소드도 하는 거 잊지 말기!
	int insertResultHistory(int teamNo);
	
	
	//  --------------- 팀 상세 페이지 조회 관련 메소드 (teamPage) ---------------
	// 팀 정보 select
	Team selectTeam(int teamNo);
	
	// teamMember select
	TeamMember selectTeamMember(int teamNo);
	
	// apply 관련 정보 select
	// 후에 group 상세 페이지에서도 중복 사용
	Apply selectApply(int moimNo);
	
	// --------------- 팀 상세 페이지(신청자 입장) ---------------
	// 신청하는 메소드
	// 신청하는 loginUser 번호, 팀 번호로다가
	int insertApply(Team team);
	
	// --------------- 팀 상세페이지(팀장 입장) ---------------
	// 신청 수락
	int ajaxUpdateApply(int applyNo);
	
	// 신청 거절
	int ajaxDeleteApply(int applyNo);
	
	// 팀 페이지 수정
	int updateTeam(int teamNo);
	
	// 팀 멤버 수정(권한 수정도)
	int updateTeamMember(int teamNo);
	
	// 팀장이 아닐 경우에만 탈퇴할 수 있도록 걸어둬야 한다. 팀장이면 권한 수정하라고 alert 예정
	int deleteTeamMember(int memNo);
	
	
	
	
	
}
