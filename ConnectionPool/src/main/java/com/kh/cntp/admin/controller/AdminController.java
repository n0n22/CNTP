package com.kh.cntp.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	
	
	// 관리자 페이지로 이동 

	
	
	
//------------------------------------------
//   회원 관련 기능 
//-------------------------------------------
	
	// 회원목록 조회 -> 회원관리 페이지로 이동
	@RequestMapping("memberList.ad")
	public String selectMemberList() {
		
		return "admin/adminMemberList";
	}
	

	
	

	
	
//------------------------------------------
//  신고 관련 기능 
//-------------------------------------------	
	

	
	// 신고글 목록 조회 -> 신고글 목록 페이지로 이동
	@RequestMapping("reportList.ad")
	public String selectReportList() {
		
		return "admin/adminReportList";
	}
	
	
	// 신고글 상세 조회 -> 신고글 상세 페이지로 이동
	@RequestMapping("reportDetail.ad")
	public String selectReport() {
		
		return "admin/adminReportDetail";
	}
	
	
	
	
	// 패널티목록 조회 -> 패널티 목록 페이지로 이동
	@RequestMapping("penaltyList.ad")
	public String selectPenaltyList() {
		
		return "admin/adminPenaltyList";
	}
	
	
	
	
	
	// 신고 등록 폼으로 이동
	@RequestMapping("reportForm")
	public String reportEnrollForm(String test, Model model) {
		System.out.println(test);
		model.addAttribute("test", test);
		return "admin/reportEnrollForm";
	}

	
	
	
	
//------------------------------------------
//  배너 관련 기능 
//-------------------------------------------	
	
	
	// 배너목록 조회 -> 배너관리 페이지로 이동
	@RequestMapping("bannerList.ad")
	public String selectBannerList() {
		
		return "admin/adminBannerList";
	}
	
	
	// 배너등록 페이지로 이동
	@RequestMapping("bannerEnrollForm.ad")
	public String bannerEnrollForm() {
		
		return "admin/adminBannerEnrollForm";
	}
	
	
	
	
	
	
	
	
//------------------------------------------
//  공지 관련 기능 
//-------------------------------------------


	// 공지 작성 페이지로 이동
	@RequestMapping("noticeEnrollForm.ad")
	public String noticeEnrollForm() {
		return "admin/adminNoticeEnrollForm";
	}
	
	
	// 공지 수정 페이지로 이동
	@RequestMapping("noticeUpdateForm.ad")
	public String noticeUpdateForm() {
		return "admin/adminNoticeUpdateForm";
	}
	
	
	
	// 공지 등록

	
	
	
	
	
}
