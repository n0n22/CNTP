package com.kh.cntp.member.model.service;

import com.kh.cntp.member.model.vo.Member;

public interface MemberService {
	
	// memberService InterFace
	
	// 로그인
	Member loginMember(Member member);
	
	// 로그인 실패 횟수 증가
	int loginCount(Member member);
	
	// 로그인 실패횟수 초기화
	int loginCountReset(Member member);
	
	// 로그인 실패로 인한 로그인 금지
	int loginStopped(Member member);
		
	// ID찾기
	Member findId(Member member);
	
	// 비밀번호 찾기 (인증메일요청)
	int findPwdMailRequest(Member member);
}
