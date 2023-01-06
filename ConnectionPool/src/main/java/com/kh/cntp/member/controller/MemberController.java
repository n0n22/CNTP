package com.kh.cntp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	// 로그인 페이지
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		return "member/login";
	}
	
	// 회원가입 페이지
	@RequestMapping("MemberEnrollForm.me")
	public String MemberEnrollForm() {
		
		return "member/memberEnrollForm";
	}
}
