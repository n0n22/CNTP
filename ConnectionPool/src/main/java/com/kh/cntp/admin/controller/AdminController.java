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
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.common.template.Template;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.vo.TeamMember;
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
	
//	// 회원목록 조회 -> 회원관리 페이지로 이동
//	@RequestMapping("memberList.ad")
//	public ModelAndView selectMemberList(@RequestParam(value="cpage", defaultValue="1") int cpage
//								  ,@RequestParam(value="bl", defaultValue="10") int boardLimit
//								  ,@RequestParam(value="order", defaultValue="memNo") String order
//								  ,@RequestParam(value="orderCondition", defaultValue="desc") String orderCondition
//								  ,ModelAndView mv) {
//		
//		// cpage : 요청페이지
//		PageInfo pi = Pagination.getPageInfo(adminService.selectMemberListCount(), cpage, 5, boardLimit);
//
//		// 정렬기준과 페이지에 보여줄 개수를 Hashmap에 담아서 조회해옴
//		HashMap map = new HashMap();
//		map.put("pi", pi);
//		map.put("order", order);
//		map.put("orderCondition", orderCondition);
//				
//		ArrayList<Member> list = adminService.selectMemberList(map);
//
//		mv.addObject("list", list).addObject("pi", pi).addObject("order", order).addObject("orderCondition", orderCondition);
//		mv.setViewName("admin/adminMemberList");
//
//		return mv;
//	}
	
	
	// 회원 검색 기능
	@RequestMapping("memberList.ad")
	public ModelAndView selectSearchMemberList(@RequestParam(value="cpage", defaultValue="1") int cpage                           // 요청 페이지
											  ,@RequestParam(value="bl", defaultValue="10") int boardLimit
											  ,@RequestParam(value="order", defaultValue="memNo") String order
											  ,@RequestParam(value="orderCondition", defaultValue="asc") String orderCondition	  // 정렬
											  ,@RequestParam(value="keyword", defaultValue="") String keyword
											  ,@RequestParam(value="condition", defaultValue="") String condition                 // 검색
										      ,ModelAndView mv) {
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		map.put("condition", condition);
		
		
		// System.out.println(boardLimit + order + orderCondition + keyword + condition);
		// System.out.println(adminService.selectSearchMemberListCount(map));
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectSearchMemberListCount(map), cpage, 5, boardLimit);
		
		map.put("pi", pi);
		map.put("order", order);
		map.put("orderCondition", orderCondition);
		
		ArrayList<Member> list = adminService.selectSearchMemberList(map);
		
		// System.out.println(list);
		mv.addObject("list", list).addObject("pi", pi).addObject("order", order).addObject("orderCondition", orderCondition);
		mv.addObject("keyword", keyword).addObject("condition", condition);
		mv.setViewName("admin/adminMemberList");
		
		return mv;
	}
	
	
	// 회원 전체 목록 조회
	@ResponseBody
	@RequestMapping(value="allMemberList.ad", produces="application/json; charset=UTF-8")
	public String allMemberList() {
		return new Gson().toJson(adminService.allMemberList());		
	}
	
	
	
	

	
	
//-------------------------------------------
//  신고 관련 기능 
//-------------------------------------------	
	

	
	// 신고글 목록 조회 -> 신고글 목록 페이지로 이동
	@RequestMapping("reportList.ad")
	public ModelAndView selectReportList(@RequestParam(value="cpage", defaultValue="1") int cpage
									    ,@RequestParam(value="result", defaultValue="yet") String result
										,ModelAndView mv) {
		
		// System.out.println(adminService.selectReportListCount(result));
		PageInfo pi = Pagination.getPageInfo(adminService.selectReportListCount(result), cpage, 5, 10);
		
		mv.addObject("list", adminService.selectReportList(pi, result)).addObject("pi", pi).addObject("result", result);
		mv.setViewName("admin/adminReportList");
		return mv;
	}
	
	
	// 신고글 상세 조회 -> 신고글 상세 페이지로 이동
	@RequestMapping("reportDetail.ad")
	public ModelAndView selectReport(int rno, ModelAndView mv) {
		
		mv.addObject("report", adminService.selectReport(rno));
		mv.setViewName("admin/adminReportDetail");
		
		return mv;
	}
	
	
	
	
	// --------------- 신고 등록 ---------------
	
	
	
	// 신고 등록 폼으로 이동
	@RequestMapping("reportForm")
	public String reportEnrollForm(@ModelAttribute Report report, Model model) {
		// System.out.println(report);
		
		model.addAttribute("report", report);
		return "admin/reportEnrollForm";
	}
	
	
	
	// 신고 등록
	@RequestMapping("reportInsert.ad")
	public ModelAndView insertReport(@ModelAttribute Report report, ModelAndView mv) {
		// System.out.println(report);
		
		if(adminService.insertReport(report) > 0) {
			mv.addObject("alert", "신고가 정상적으로 처리되었습니다.").addObject("check", "check");
			mv.setViewName("admin/reportEnrollForm");
		} else {
			mv.addObject("errorMsg", "신고가 실패하였습니다.").setViewName("common/errorPage");
		}		
		
		return mv;
	}

	
	
	// 신고 무효
	@RequestMapping("reportInvalid.ad")
	public ModelAndView invalidReport(@ModelAttribute Report report, HttpSession session , ModelAndView mv) {
		
		if(adminService.invalidReport(report) > 0) {
			session.setAttribute("alertMsg", "신고를 무효처리했습니다.");
			mv.setViewName("redirect:reportList.ad");
		} else {
			mv.addObject("errorMsg", "신고무효처리 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	// 신고 확정
	@RequestMapping("reportConfirm.ad")
	public ModelAndView confirmReport(@RequestParam int reportNo, HttpSession session, ModelAndView mv) {
		
		if(adminService.confirmReport(reportNo) > 0) {
			session.setAttribute("alertMsg", "신고를 확정처리했습니다.");
			mv.setViewName("redirect:reportList.ad");
		} else {
			mv.addObject("errorMsg", "신고확정처리 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	

	
	
	// 패널티목록 조회 -> 패널티 목록 페이지로 이동
	@RequestMapping("penaltyList.ad")
	public ModelAndView selectPenaltyList(@RequestParam(value="cpage", defaultValue="1") int cpage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectPenaltyListCount(), cpage, 5, 10);
		mv.addObject("list", adminService.selectPenaltyList(pi)).addObject("pi", pi);
		mv.setViewName("admin/adminPenaltyList");
		
		return mv;
	}
	
	
	// 패널티 처리
	@RequestMapping("penaltyInsert.ad")
	public ModelAndView insertPenalty(int[] memNo, String[] penalty, ModelAndView mv) {
		String grade = ""; // 등급
		int sl = 0;
		
		for(int i = 0; i < memNo.length; i++) {
			
			if(penalty[i].equals("정지")) { // 정지 : select -> update or insert
				
				if(adminService.selectStopPenalty(memNo[i]) > 0) { // 정지 받은 적이 있으면 update
					adminService.updateStopPenalty(memNo[i]);
				} else { // 정지받은 적이 없으면 insert
					adminService.insertStopPenalty(memNo[i]);
				}
				
			} else { // 탈퇴 
				
				ArrayList<TeamMember> list = adminService.selectTeamMem(memNo[i]);
				
				// 팀 멤버정보 조회해오기
				if(!list.isEmpty()) { // 팀이 있으면
					
					for(TeamMember tm : list) {
						if(tm.getMemNo() == memNo[i]) {
							grade = tm.getTeamGrade(); // 등급을 뽑아냄					
						}
					}
					
					if(grade.equals("L")) { // 팀 리더일 때
						for(TeamMember tm : list) {
							if(tm.getTeamGrade().equals("S")) {
								sl = tm.getMemNo(); 
							}
						}
						if(sl > 0) { // 부리더가 있으면
							
							adminService.updateSubLeader(memNo[i], sl);
							
						} else { // 부리더가 없으면
							
							if(list.size() > 1) { // 다른 팀원이 있을 때
								
							} else { // 다른 팀원이 없을 때
								adminService.deleteTeam(memNo[i]);
							}
							
						}
											
						
					} else if (grade.equals("S")) { // 부리더일때
						
						
						
					} else { // 멤버일 때
						// 팀 탈퇴 후 멤버 상태 변경
						adminService.memberCase(memNo[i]);
					}
					
				} else { // 팀이 없으면
					// 멤버 상태 변경
					adminService.noTeamCase(memNo[i]);
					
				}
				
			}
			
		}
		
		
//		for (int i = 0; i < memNo.length; i++) {
//			Report re = new Report();
//			if(penalty[i].equals("정지")) {
//				stopList.add(memNo[i]);
//			} else {
//				kickList.add(memNo[i]);
//			}			
//		}
//		
//		System.out.println(stopList);
//		System.out.println(kickList);
//		
//		if(!stopList.isEmpty()) {
//			adminService.stopMember(stopList);
//		}
//		if(!kickList.isEmpty()) {
//			
//		}
//		
		
		mv.setViewName("redirect:penaltyList.ad");
		return mv;
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
