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
	
	
	
	
	
}
