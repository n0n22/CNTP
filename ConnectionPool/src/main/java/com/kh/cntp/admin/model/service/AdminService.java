package com.kh.cntp.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.vo.TeamMember;
import com.kh.cntp.notice.model.vo.Notice;

public interface AdminService {

	
	
	
	

//-------------------------------------------
//   회원 관련 기능 
//-------------------------------------------

	// 회원 목록 개수 조회
	int selectMemberListCount();
	
	
	// 회원 목록 조회
	ArrayList<Member> selectMemberList(HashMap map);
	
	
	// 검색한 회원 목록 개수 조회
	int selectSearchMemberListCount(HashMap map);
	
	
	// 검색한 회원 정보 조회
	ArrayList<Member> selectSearchMemberList(HashMap map);

	
	// 회원 전체 목록 조회
	ArrayList<Member> allMemberList();
	
	
//-------------------------------------------
//  신고 관련 기능 
//-------------------------------------------	
	
	// 신고 목록 개수 조회
	int selectReportListCount(String result);

	// 신고 목록 조회
	ArrayList<Report> selectReportList(PageInfo pi, String result);

	// 신고 상세 조회
	Report selectReport(Report report);
	
	
	
	// 신고 횟수 조회
	int selectReportCount(Report report);
	
	
	
	// 신고 등록
	int insertReport(Report report);
	
	
	// 신고 무효
	int invalidReport(Report report);
	
	// 신고 확정
	int confirmReport(int reportNo);
	
	
	
	// 패널티 목록 개수 조회
	int selectPenaltyListCount();

	
	// 패널티 목록 조회
	ArrayList<Report> selectPenaltyList(PageInfo pi);
	
	
	
	
	// 정지 받은 적 있는지 조회
//	int selectStopPenalty(int memNo);
	
	// 팀 멤버정보 조회해오기
	// ArrayList<TeamMember> selectTeamMem(int memNo);
//	TeamMember selectTeamMem(int memNo);
	
	
	// 패널티 처리 - 트랜잭션을 위해 한꺼번에
	int givePenalties(int[] memNo, String[] penalty);
	
	
	
	// 소속된 팀이 있는지 조회
//	int selectTeam(int memNo);
	
	
	
	
/*	
	// 정지 처리
	// int stopMember(ArrayList<Integer> stopList);
	
	
	// 정지 날짜 업데이트
	int updateStopPenalty(int memNo);
	
	// 정지 날짜 인서트
	int insertStopPenalty(int memNo);
	
	
	
	// 바꿀 팀원이 있을 때
	int updateTeamLeader(int memNo, int newLeader);
	
	
	// 바꿀 팀원이 없을 때
	int updateTeamStatus(int memNo);
	
	// 리더일때
	// 리더일때 - 부리더가 있을때
	// int updateSubLeader(int memNo, int sl);
		
	// 부리더가 없고 다른 팀원도 없을 때
	// int deleteTeam(int memNo);
	
	// 멤버일때
	// 팀 탈퇴 후 멤버 상태 변경
	// int memberCase(int memNo);
	
	// 팀이 없을때
	// int noTeamCase(int memNo);
*/	
	
	
	
	
//-------------------------------------------
//  배너 관련 기능 
//-------------------------------------------	
	
	// 배너 목록개수 조회
	int selectBannerListCount(String status);
	
	// 배너 목록 조회
	ArrayList<Banner> selectBannerList(String status, PageInfo pi);
	
	// 배너 등록
	int insertBanner(Banner banner);
	
	// 배너 수정
	int updateBanner(Banner banner);
	
	// 메인페이지 배너 조회
	ArrayList<Banner> selectMainBannerList();
	
	
//-------------------------------------------
//  공지 관련 기능 
//-------------------------------------------


	// 공지사항 등록
	int insertNotice(Notice notice);
	
	
	// 공지사항 수정
	int updateNotice(Notice notice);
	
	
	// 공지사항 삭제
	int deleteNotice(int nno);
	
	
	// 자동완성
	ArrayList<String> selectListName();
	ArrayList<String> selectListId();
	ArrayList<String> selectListNickname();
	
	
	
	
	
	
	
}
