package com.kh.cntp.admin.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.common.template.Template;
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
