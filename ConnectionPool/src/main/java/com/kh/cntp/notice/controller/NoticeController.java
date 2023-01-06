package com.kh.cntp.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	
	// 공지사항 목록 조회 -> 공지사항 목록 페이지로 이동
	@RequestMapping("list.no")
	public String selectNoticeList() {
		
		
		return "notice/noticeList";
	}
	
	
	
	// 공지사항 상세 조회 -> 공지사항 상세 페이지로 이동
	@RequestMapping("detail.no")
	public String selectNoticeDetail() {
		
		
		return "notice/noticeDetail";
	}
	
	
	
	
	
	

}
