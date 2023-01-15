package com.kh.cntp.member.model.service;

import java.util.ArrayList;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.member.model.vo.Point;

public interface MemberService {
	
	// memberService InterFace
	
	// 로그인
	Member loginMember(Member member);
	
	// 회원가입
	int insertMember(Member member);
	
	// 로그인 실패 횟수 증가
	int loginCount(Member member);
	
	// 로그인 실패횟수 초기화
	int loginCountReset(Member member);
	
	// 로그인 실패로 인한 로그인 금지
	int loginStopped(Member member);
		
	// ID찾기
	Member findId(Member member);
	
	// 메일보내기 전 Cert테이블에 추가
	void sendMail(Cert cert);
	
	// 비밀번호 찾기 (인증메일요청)
	int findPwdMailRequest(Member member);
	
	// 인증번호 확인 
	boolean certNumCheck(Cert cert);
	
	// 비밀번호 변경
	int pwdChange(Member member);
	
	// 회원정보 수정
	int myPageInfoUpdate(Member member);
	
	// 회원 탈퇴
	int myPageDelete(Member member);
	
	// 회원 프로필 조회
	Member showProfile(int memNo);
	
	// 포인트 내역 개수 조회
	int selectPointCount(Point point);
	
	// 포인트 내역 조회
	ArrayList<Point> selectPointList(PageInfo pi, Point point);
	
}
