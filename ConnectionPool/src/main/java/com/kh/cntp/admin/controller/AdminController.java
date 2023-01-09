package com.kh.cntp.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.admin.model.service.AdminService;
import com.kh.cntp.common.template.Template;
import com.kh.cntp.notice.model.vo.Notice;

@Controller
public class AdminController {

	
	
	// 관리자 페이지로 이동 
	@Autowired
	private AdminService adminService;
	
	
	
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
	@RequestMapping("noticeInsert.ad")  // 첨부파일이 여러개라면? MutipartFile[] upfile (배열로 받을 수 있음)
	public String insertNotice(Notice notice, MultipartFile upfile, HttpSession session, ModelAndView mv) {

		if (!upfile.getOriginalFilename().equals("")) { // 첨부파일이 있을 경우
			
			notice.setOriginName(upfile.getOriginalFilename());
			notice.setChangeName("resources/uploadFiles/" + Template.saveFile(upfile, session));
		}
		
		if(adminService.insertNotice(notice) > 0) { 
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			mv.setViewName("redirect:list.no");					
		} else { // 실패 => 에러페이지
			mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
	
}
