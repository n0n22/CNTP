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
}
