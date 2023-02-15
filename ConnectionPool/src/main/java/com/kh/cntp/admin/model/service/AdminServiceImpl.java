package com.kh.cntp.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.admin.model.dao.AdminDao;
import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.vo.TeamMember;
import com.kh.cntp.notice.model.vo.Notice;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
//-------------------------------------------
//  회원 관련 기능 
//-------------------------------------------
	
	// 회원 목록 개수 조회
	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount(sqlSession);
	}
	
	// 회원 목록 조회
	@Override
	public ArrayList<Member> selectMemberList(HashMap map) {
		return adminDao.selectMemberList(sqlSession, map);
	}
	
	
	// 검색한 회원 목록 개수 조회
	@Override
	public int selectSearchMemberListCount(HashMap map) {
		return adminDao.selectSearchMemberListCount(sqlSession, map);
	}
	
	// 검색한 회원 목록 조회
	@Override
	public ArrayList<Member> selectSearchMemberList(HashMap map) {
		return adminDao.selectSearchMemberList(sqlSession, map);
	}
	
	// 회원 전체 목록 조회
	@Override
	public ArrayList<Member> allMemberList() {
		return adminDao.allMemberList(sqlSession);
	}
	
	
	
	
	
	

	
	
//-------------------------------------------
// 신고 관련 기능 
//-------------------------------------------	
	
	// 신고 목록 개수 조회
	@Override
	public int selectReportListCount(String result) {
		return adminDao.selectReportListCount(sqlSession, result);
	}
	
	
	// 신고 목록 조회
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi, String result) {
		return adminDao.selectReportList(sqlSession, pi, result);
	}
	
	
	// 신고 상세 조회
	@Override
	public Report selectReport(Report report) {
		return adminDao.selectReport(sqlSession, report);
	}
	
	
	// 신고 횟수 조회
	@Override
	public int selectReportCount(Report report) {
		return adminDao.selectReportCount(sqlSession, report);
	}
	
	
	
	
	// 신고 등록 : REPORT insert + BOARD update
	@Transactional
	@Override
	public int insertReport(Report report) {
		return adminDao.insertReport(sqlSession, report) * adminDao.updateBoardStatus(sqlSession, report);
	}
	
	
	// 신고 무효 : REPORT update + BOARD update
	@Transactional
	@Override
	public int invalidReport(Report report) {
		return adminDao.invalidReport(sqlSession, report.getReportNo()) * adminDao.reUpdateBoardStatus(sqlSession, report);
	}
	
	
	// 신고 확정 : REPORT update
	@Override
	public int confirmReport(int reportNo) {
		return adminDao.confirmReport(sqlSession, reportNo);
	}
	
	
	
	// 패널티 목록 개수 조회
	@Override
	public int selectPenaltyListCount() {
		return adminDao.selectPenaltyListCount(sqlSession);
	}
	
	
	// 패널티 목록 조회
	@Override
	public ArrayList<Report> selectPenaltyList(PageInfo pi) {
		return adminDao.selectPenaltyList(sqlSession, pi);
	}
		
	
/*
	// 정지 처리
//	@Override
//	public int stopMember(ArrayList<Integer> stopList) {
//		return adminDao.stopMember(sqlSession, stopList);
//	}
	
	
	
	
	// 정지 날짜 업데이트 
	@Override
	public int updateStopPenalty(int memNo) {
		return adminDao.updateStopPenalty(sqlSession, memNo);
	}
	
	// 정지 날짜 인서트
	@Override
	public int insertStopPenalty(int memNo) {
		return adminDao.insertStopPenalty(sqlSession, memNo);
	}
*/	
	
	// 팀 멤버정보 조회해오기
//	@Override
//	public ArrayList<TeamMember> selectTeamMem(int memNo) {
//		return adminDao.selectTeamMem(sqlSession, memNo);
//	}
//	@Override
//	public int selectTeamMem(int memNo) {
//		return adminDao.selectTeamMem(sqlSession, memNo);
//	}
//	
//	// 정지 처리된 적 있는지 조회
//	@Override
//	public int selectStopPenalty(int memNo) {
//		return adminDao.selectStopPenalty(sqlSession, memNo);
//	}
//	
//	// 소속된 팀이 있는지 조회
//	@Override
//	public int selectTeam(int memNo) {
//		return adminDao.selectTeam(sqlSession, memNo);
//	}
	
	// 패널티 처리 - 트랜잭션을 위해 한꺼번에
	@Transactional
	@Override
	public int givePenalties(int[] memNo, String[] penalty) {
		int result = 1;
		for(int i = 0; i < memNo.length; i++) {
			
			switch (penalty[i]) {
			case "정지" : 
				result *= adminDao.stopPenalty(sqlSession, memNo[i]); 
				break;
//				if(adminDao.selectStopPenalty(sqlSession, memNo[i]) > 0) { // 정지 받은 적이 있으면 update
//					result *= adminDao.updateStopPenalty(sqlSession, memNo[i]);
//					break;
//				} else { // 정지받은 적이 없으면 insert
//					result *= adminDao.insertStopPenalty(sqlSession, memNo[i]);
//					break;
//				}
			case "탈퇴" :	
				TeamMember teamInfo = adminDao.selectTeam(sqlSession, memNo[i]);
				
				if (teamInfo != null) { // 소속 팀 정보가 있을 때
					TeamMember nl = adminDao.selectTeamMem(sqlSession, memNo[i]);
					
					if(teamInfo.getTeamGrade().equals("L")) { // 리더였을 때
						
						if(nl != null) { // 소속팀이 있고, 바꿀 멤버가 있을 때
							result *= adminDao.updateTeamLeader(sqlSession, nl.getMemNo()); // 새 팀장으로 업데이트
							
						} else { // 소속 팀이 있고, 바꿀 멤버가 없을 때
							result *= adminDao.updateTeamStatus(sqlSession, memNo[i]); // 팀 상태 변경

						} 
					}
					
					// 그냥 멤버였을 때
					result *= adminDao.deleteTeamMember(sqlSession, memNo[i]); // 팀멤버테이블에서 삭제
				} 
				
				// 무조건 실행
				// 소속 팀이 없을 때	
				result *= adminDao.updateMemberStatus(sqlSession, memNo[i]); // 멤버 상태 변경
				break;
			}
		}

		return result;
	}
	
	
	
	
	
	
/*	
	// 바꿀 팀원이 있을 때
	@Transactional
	@Override
	public int updateTeamLeader(int memNo, int newLeader) {
		return adminDao.updateTeamLeader(sqlSession, newLeader) // 새 팀장으로 업데이트
				* adminDao.deleteTeamMember(sqlSession, memNo) // 팀멤버테이블에서 삭제
				* adminDao.updateMemberStatus(sqlSession, memNo); // 멤버 상태 변경
	}
	
	
	// 바꿀 팀원이 없을 때
	@Transactional
	@Override
	public int updateTeamStatus(int memNo) {
		return adminDao.updateTeamStatus(sqlSession, memNo) // 팀 상태 변경
				* adminDao.deleteTeamMember(sqlSession, memNo) // 팀멤버테이블에서 삭제
				* adminDao.updateMemberStatus(sqlSession, memNo); // 멤버 상태 변경
	}
//	// 리더일때 - 부리더가 있을 때
//	@Transactional
//	@Override
//	public int updateSubLeader(int memNo, int sl) {
//		return adminDao.updateSubLeader(sqlSession, sl) // 부리더를 리더로
//				* adminDao.deleteTeamMember(sqlSession, memNo) // 팀 탈퇴
//				* adminDao.updateMemberStatus(sqlSession, memNo); // 멤버상태변경
//	}
//	
//	
//	
//	// 부리더가 없고 다른 팀원도 없을 때
//	@Transactional
//	@Override
//	public int deleteTeam(int memNo) {
//		return adminDao.updateTeamStatus(sqlSession, memNo) // 팀 상태 변경
//				* adminDao.deleteTeamMember(sqlSession, memNo) // 팀탈퇴
//				* adminDao.updateMemberStatus(sqlSession, memNo); // 멤버상태변경
//	}
//		
//	
//	// 멤버일때
//	// 팀 탈퇴 후 멤버 상태 변경
//	@Transactional
//	@Override
//	public int memberCase(int memNo) {
//		return adminDao.deleteTeamMember(sqlSession, memNo) // 팀 탈퇴
//				* adminDao.updateMemberStatus(sqlSession, memNo); // 멤버상태변경
//	}
//	
//	// 팀이 없을때
//	@Override
//	public int noTeamCase(int memNo) {
//		return adminDao.updateMemberStatus(sqlSession, memNo); // 멤버상태변경
//	}
*/	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//-------------------------------------------
// 배너 관련 기능 
//-------------------------------------------	

	// 배너 목록 개수 조회
	@Override
	public int selectBannerListCount(String status) {
		return adminDao.selectBannerListCount(sqlSession, status);
	}


	// 배너 목록 조회
	@Override
	public ArrayList<Banner> selectBannerList(String status, PageInfo pi) {
		return adminDao.selectBannerList(sqlSession, status, pi);
	}

	
	// 배너 등록
	@Override
	public int insertBanner(Banner banner) {
		return adminDao.insertBanner(sqlSession, banner);
	}
	

	// 배너 수정
	@Override
	public int updateBanner(Banner banner) {
		return adminDao.updateBanner(sqlSession, banner);
	}

	
	
	// 메인페이지 배너 조회
	@Override
	public ArrayList<Banner> selectMainBannerList() {
		return adminDao.selectMainBannerList(sqlSession);
	}
	
	
	
//-------------------------------------------
// 공지 관련 기능 
//-------------------------------------------

	// 공지사항 등록
	@Override
	public int insertNotice(Notice notice) {		
		return adminDao.insertNotice(sqlSession, notice);
	}



	// 공지사항 수정
	@Override
	public int updateNotice(Notice notice) {
		return adminDao.updateNotice(sqlSession, notice);
	}

	

	// 공지사항 삭제
	@Override
	public int deleteNotice(int nno) {
		return adminDao.deleteNotice(sqlSession, nno);
	}

	
	
	// 자동완성
	@Override
	public ArrayList<String> selectListName() {
		return adminDao.selectListName(sqlSession);
	}

	@Override
	public ArrayList<String> selectListId() {
		return adminDao.selectListId(sqlSession);
	}

	@Override
	public ArrayList<String> selectListNickname() {
		return adminDao.selectListNickname(sqlSession);
	}






















	
	
	
	
	
	
	
	
	
}
