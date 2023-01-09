package com.kh.cntp.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	// 공지사항 목록 조회 -> 공지사항 목록 페이지로 이동
	@RequestMapping("list.no")
	public ModelAndView selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int cpage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(noticeService.selectListCount(), cpage, 10, 5);
		mv.addObject("list", noticeService.selectList()).setViewName("notice/noticeList");		
		return mv;
	}
	
	
	
	// 공지사항 상세 조회 -> 공지사항 상세 페이지로 이동
	@RequestMapping("detail.no")
	public String selectNoticeDetail() {
		
		
		return "notice/noticeDetail";
	}
	
	
	
	
	
	

}
