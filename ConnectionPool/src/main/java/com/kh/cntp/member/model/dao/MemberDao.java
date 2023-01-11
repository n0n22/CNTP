package com.kh.cntp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}
	
	public int loginCount(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginCount", member);
	}
	
	public int loginCountReset(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginCountReset", member);
	}
	
	public int loginStopped(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginStopped", member);
	}
	
	public Member findId(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findId", member);
	}
	
	public int findPwdMailRequest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findPwdMailRequest", member);
	}

}
