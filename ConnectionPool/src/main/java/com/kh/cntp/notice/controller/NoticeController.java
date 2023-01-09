package com.kh.cntp.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	
	// 공지사항 목록 조회 -> 공지사항 목록 페이지로 이동
	@RequestMapping("list.no")
	public String selectNoticeList(HttpSession session) {
		
		session.setAttribute("alertMsg", "알럿테스트");
		
		return "notice/noticeList";
	}
	
	
	
	// 공지사항 상세 조회 -> 공지사항 상세 페이지로 이동
	@RequestMapping("detail.no")
	public String selectNoticeDetail() {
		
		
		return "notice/noticeDetail";
	}
	
	
	
	
	
	

}
