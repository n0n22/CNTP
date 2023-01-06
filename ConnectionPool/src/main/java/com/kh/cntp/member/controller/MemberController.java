package com.kh.cntp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	// ---화면지정용 나중에 전부 수정 및 로직 구성할 예정
	
	// 로그인 페이지
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/login";
	}
	
	// 로그인
	
	
	// ID찾기 페이지
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	// 아이디 찾기 
	@RequestMapping("findId.me")
	public String findId() {
		return "member/findIdResult";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwd";
	}
		
	// 비밀번호 재설정 인증(인증받고 재설정)
	@RequestMapping("findPwdCert.me")
	public String findPwdCert() {
		return "member/findPwdChange";
	}
	
	// 비밀번호 재설정 
	@RequestMapping("findPwd")
	public String findPwd() {
		return "member/findPwdResult";
	}
	
	
	// 회원가입 페이지
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 회원가입 
	@RequestMapping("memberInsert.me")
	public String insertMember() {
		return "member/memberEnrollResult";
	}
	
	
}
