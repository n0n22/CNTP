package com.kh.cntp.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.cntp.admin.model.service.AdminService;
import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.common.template.Template;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.notice.model.service.NoticeService;
import com.kh.cntp.notice.model.vo.Notice;

@Controller
public class AdminController {

	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	
	// 관리자 페이지로 이동 

	
	
	
//-------------------------------------------
//   회원 관련 기능 
//-------------------------------------------
	
	// 회원목록 조회 -> 회원관리 페이지로 이동
	@RequestMapping("memberList.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue="1") int cpage
								  ,@RequestParam(value="bl", defaultValue="10") int boardLimit
								  ,@RequestParam(value="order", defaultValue="enroll_date desc") String order
								  ,Model model) {
		System.out.println(cpage);
		System.out.println(boardLimit);
		System.out.println(order);
		
		// cpage : 요청페이지
		PageInfo pi = Pagination.getPageInfo(adminService.selectMemberListCount(), cpage, 5, boardLimit);

		// 정렬기준과 페이지에 보여줄 개수를 Hashmap에 담아서 조회해옴
		HashMap map = new HashMap();
		map.put("pi", pi);
		map.put("order", order);
		
		ArrayList<Member> list = adminService.selectMemberList(map);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("order", order);
				
		return "admin/adminMemberList";
	}
	
	
	// 회원 검색 기능
//	@RequestMapping("memberSearch.ad")
//	public ModelAndView searchMemb
	
	
	
	

	
	
//-------------------------------------------
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

	
	
	
	
//-------------------------------------------
//  배너 관련 기능 
//-------------------------------------------	
	
	
	// 배너목록 조회 -> 배너관리 페이지로 이동
	@RequestMapping("bannerList.ad")
	public String selectBannerList(@RequestParam(value="cpage", defaultValue="1") int cpage, @RequestParam(value="status", defaultValue="Y") String status, Model model) {
		// cpage : 요청한 페이지
		// status : 보여지는 상태
		PageInfo pi = Pagination.getPageInfo(adminService.selectBannerListCount(status), cpage, 5, 6);
		model.addAttribute("list", adminService.selectBannerList(status, pi));
		model.addAttribute("pi", pi);
		model.addAttribute("status", status);
		return "admin/adminBannerList";
	}
	
	// 메인페이지 배너 목록 조회
	@ResponseBody
	@RequestMapping(value="mainBanner", produces="application/json; charset=UTF-8")
	public String selectMainBannerList() {
		return new Gson().toJson(adminService.selectMainBannerList());
	}
	

	
	// 배너등록 페이지로 이동
	@RequestMapping("bannerEnrollForm.ad")
	public String bannerEnrollForm() {
		
		return "admin/adminBannerEnrollForm";
	}
	
	
	// 배너등록
	@RequestMapping("bannerInsert.ad")
	public ModelAndView insertBanner(Banner banner, MultipartFile upfile, HttpSession session, ModelAndView mv) {
		
		if (!upfile.getOriginalFilename().equals("")) {
			banner.setOriginName(upfile.getOriginalFilename());
			banner.setChangeName("resources/upfiles/" + Template.saveFile(upfile, session));
		}
		
		if(adminService.insertBanner(banner) > 0) { 
			session.setAttribute("alertMsg", "배너가 등록되었습니다.");
			mv.setViewName("redirect:bannerList.ad");					
		} else { 
			mv.addObject("errorMsg", "배너 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 배너수정
	@RequestMapping("bannerUpdate.ad")
	public String updateBanner(@ModelAttribute Banner banner, HttpSession session) {
		// System.out.println(bnno);
		// System.out.println(status);
		// System.out.println(banner);
		if(adminService.updateBanner(banner) > 0) {
			session.setAttribute("errorMsg", "배너를 수정했습니다.");
		} else {
			session.setAttribute("errorMsg", "배너 수정 실패");			
		}
		
		return "redirect:bannerList.ad";
	}

	
	
	
	
	
	
	
	
	
//-------------------------------------------
//  공지 관련 기능 
//-------------------------------------------


	// 공지 작성 페이지로 이동
	@RequestMapping("noticeEnrollForm.ad")
	public String noticeEnrollForm() {
		return "admin/adminNoticeEnrollForm";
	}
	
	
	// 공지 수정 페이지로 이동
	@RequestMapping("noticeUpdateForm.ad")
	public String noticeUpdateForm(int nno, Model model) {
		model.addAttribute("notice", noticeService.selectDetail(nno));
		return "admin/adminNoticeUpdateForm";
	}
	
	
	
	// 공지 등록
	@RequestMapping("noticeInsert.ad")  // 첨부파일이 여러개라면? MutipartFile[] upfile (배열로 받을 수 있음)
	public ModelAndView insertNotice(Notice notice, MultipartFile upfile, HttpSession session, ModelAndView mv) {
		
		// System.out.println(notice);
		// System.out.println(upfile);
		
		if (!upfile.getOriginalFilename().equals("")) { // 첨부파일이 있을 경우
			notice.setOriginName(upfile.getOriginalFilename());
			notice.setChangeName("resources/upfiles/" + Template.saveFile(upfile, session));
		}
		
		if(adminService.insertNotice(notice) > 0) { 
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			mv.setViewName("redirect:list.no");					
		} else { 
			mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	// 공지 수정
	@RequestMapping("noticeUpdate.ad")
	public ModelAndView updateNotice(Notice notice, MultipartFile reUpfile, HttpSession session, ModelAndView mv) {
		
		// 새로운 첨부파일이 넘어온 경우
		if(!reUpfile.getOriginalFilename().equals("")) { // 빈문자열이 아닐 때
			// 기존 첨부파일이 있었을 경우? => 기존의 파일 삭제
			if(notice.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(notice.getChangeName())).delete();
			}
						
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			// saveFile() 호출해서 첨부파일을 업로드
			String changeName = Template.saveFile(reUpfile, session);
			
			// b라는 Board객체에 새로운 정보 (원본명, 저장경로 담기)
			notice.setOriginName(reUpfile.getOriginalFilename());
			notice.setChangeName("resources/upfiles/" + changeName);
		}
		
		if(adminService.updateNotice(notice) > 0) {
			session.setAttribute("alertMsg", "공지사항을 수정했습니다.");
			mv.setViewName("redirect:detail.no?nno=" + notice.getNoticeNo());
		} else {
			mv.addObject("errorMsg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	// 공지 삭제
	@RequestMapping("noticeDelete.ad")
	public ModelAndView deleteNotice(int nno, String filePath, ModelAndView mv, HttpSession session) {
		
		if(adminService.deleteNotice(nno) > 0) { // 삭제 성공
			if(!filePath.equals("")) { // 첨부파일이 존재할 때 기존의 첨부파일 삭제
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", nno +"번 공지사항을 삭제했습니다.");
			mv.setViewName("redirect:list.no");
		} else { // 삭제 실패
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common.errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
}
