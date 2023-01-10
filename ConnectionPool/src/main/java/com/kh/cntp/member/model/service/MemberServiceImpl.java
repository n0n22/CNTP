package com.kh.cntp.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.member.model.dao.MemberDao;
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
	
	// 로그인 실패 횟수
	@Override
	public int loginCount(Member member) {
		return 0;
	}
	
	// 로그인 실패횟수 초기화
	@Override
	public int loginCountReset(Member member) {
		return 0;
	}
	
	
	
	
	
}
