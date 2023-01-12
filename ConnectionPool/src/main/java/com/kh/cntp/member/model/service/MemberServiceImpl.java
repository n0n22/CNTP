package com.kh.cntp.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.member.model.dao.MemberDao;
import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	// 필드 인젝션 D.I 
	@Autowired 
	private MemberDao memberDao;
	
	// sqlSessionTemplate == sqlSession 대체
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인용 메소드
	@Override
	public Member loginMember(Member member) {
		return memberDao.loginMember(sqlSession, member);
	}
	
	// 회원가입
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(sqlSession, member);
	}

	
	
	// 로그인 실패 횟수
	@Override
	public int loginCount(Member member) {
		return memberDao.loginCount(sqlSession, member);
	}
	
	// 로그인 실패횟수 초기화 (로그인 성공시)
	@Override
	public int loginCountReset(Member member) {
		return memberDao.loginCountReset(sqlSession, member);
	}

	// 로그인 실패로 인한 로그인정지
	@Override
	public int loginStopped(Member member) {
		return memberDao.loginStopped(sqlSession, member);
	}
	
	// 아이디 찾기
	@Override
	public Member findId(Member member) {
		return memberDao.findId(sqlSession, member);
	}
	
	// 메일보내기 전 Cert테이블에 추가
	@Override
	public void sendMail(Cert cert) {
		memberDao.sendMail(sqlSession, cert); 
	}
	
	// 비밀번호 변경 시 메일 인증번호 요청
	@Override
	public int findPwdMailRequest(Member member) {
		return memberDao.findPwdMailRequest(sqlSession, member);
	}
	
	// 인증번호 확인
	@Override
	public boolean certNumCheck(Cert cert) {
		return memberDao.certNumCheck(sqlSession, cert);
	}
	
	// 비밀번호 변경
	@Override
	public int pwdChange(Member member) {
		return memberDao.pwdChange(sqlSession, member);
	}

	
	
	
	
	

	
	
	
	
	
}
