package com.kh.cntp.admin.model.service;

import java.util.ArrayList;

import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.vo.Notice;

public interface AdminService {

	
	
	
	

//-------------------------------------------
//   회원 관련 기능 
//-------------------------------------------
	

	
	

	
	
//-------------------------------------------
//  신고 관련 기능 
//-------------------------------------------	
	

	

	
	
	
	
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
