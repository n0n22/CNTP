package com.kh.cntp.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
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
	Report selectReport(int rno);
	
	
	
	
	
	// 신고 등록
	int insertReport(Report report);
	
	
	// 신고 무효
	int invalidReport(Report report);
	
	// 신고 확정
	int confirmReport(int reportNo);
	

	
	
	
	
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
	
	
	
	
	
	
	
}
