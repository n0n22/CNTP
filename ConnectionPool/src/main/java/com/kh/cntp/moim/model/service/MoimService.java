package com.kh.cntp.moim.model.service;

import java.util.ArrayList;

import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Chatting;
import com.kh.cntp.moim.model.vo.Group;
import com.kh.cntp.moim.model.vo.Team;
import com.kh.cntp.moim.model.vo.TeamMember;

public interface MoimService {
	
	
	// --------------- 팀 등록 관련 메소드 (teamEnrollForm) ---------------
	
	// teamEnrollForm 페이지에서 비동기식으로 팀 이름 중복 체크
	int ajaxSelectTeam(String checkName);
	
	// 팀 등록
	int insertTeam(Team team);
	
	
	//  --------------- 팀 상세 페이지 조회 관련 메소드 (teamPage) ---------------
	// 팀 정보 select
	Team selectTeam(String teamNo);
	
	// teamMember select
	ArrayList<TeamMember> selectTeamMemberList(String teamNo);
	
	// apply 관련 정보 select
	// 후에 group 상세 페이지에서도 중복 사용하지 못 했음....
	ArrayList<Apply> selectApplyList(String moimNo);
	
	ArrayList<Apply> selectGroupApplyList(String moimNo);
	
	
	// 팀 승패 기록 select
	ResultHistory seletResultHistory(String teamNo);
	
	// --------------- 팀 상세 페이지(신청자 입장) ---------------
	// 신청하는 메소드
	// 신청하는 loginUser 번호, 팀 번호로다가
	int insertApply(Apply ap);
	
	Apply ajaxSelectApply(Apply ap);
	
	// --------------- 팀 상세페이지(팀장 입장) ---------------
	// 신청 수락
	int insertTeamMember(TeamMember tm, Apply ap);
	
	int updateApply(Apply ap);
	
	// 신청 거절
	int deleteApply(Apply ap);
	
	// 팀 페이지 수정
	int updateTeam(Team team);
	
	// 팀 멤버 수정(권한 수정도)
	int updateTeamMember(ArrayList<TeamMember> teamMemberList);
	
	// 팀장이 아닐 경우에만 탈퇴할 수 있도록 걸어둬야 한다. 팀장이면 권한 수정하라고 alert 예정
	int deleteTeamMember(TeamMember tm);
	
	// 팀 뱃지 status를 N에서 Y로 수정
	// 성공 시 포인트 -100도 해줘야 한다.
	int updateTeamBadgeStatus(Team team);
	
	// --------------- 팀 가입 리스트 조회 ---------------
	// 조건에 따라 team을 조회해와야 하기 때문에 team을 인자값으로 넣어준다.
	ArrayList<Team> selectTeamList(PageInfo pi, Team team);
	
	// 페이징을 위해 조건에 맞는 TeamListcount를 구해야 한다.
	int selectTeamCountList(Team team);
	
	
	// --------------- 채팅 관련 기능 ---------------
	ArrayList<Chatting> selectChattingList(Chatting chat);
	
	int ajaxInsertChatting(Chatting chat);
	
	int ajaxDeleteChatting(String chatNo);
	
	ArrayList<Member> selectAcceptMember(String groupNo);
	
	// --------------- 소그룹 시작 ---------------
	
	// --------------- GroupListView ---------------
	// 조건에 따라 소그룹 조회해오기
	ArrayList<Group> selectGroupList(PageInfo pi, Group group);
	
	//페이징을 위해 조건에 맞는 groupListCount 구해오기
	int selectGroupCountList(Group group);
	
	// 팀 등록하는 메소드
	int insertGroup(Group group);
	
	// --------------- GroupDetailView ---------------
	// 소그룹페이지
	// 소그룹 페이지 들어가면 select
	Group selectGroup(String groupNo);
	
	// 소그룹 글 수정
	int updateGroup(Group group);
	
	// 소그룸 글 삭제
	int deleteGroup(Group group);
	
	
}
