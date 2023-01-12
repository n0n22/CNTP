package com.kh.cntp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;

@Repository
public class MemberDao {
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}
	
	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	// 회원가입 시 메일 인증
	public int insertMailRequest(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.insert("memberMapper.insertMailRequest", email);
	}
	
	// 로그인 실패 횟수
	public int loginCount(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginCount", member);
	}
	
	// 로그인 실패횟수 초기화 (로그인 성공시)
	public int loginCountReset(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginCountReset", member);
	}
	
	// 로그인 실패로 인한 로그인정지
	public int loginStopped(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.loginStopped", member);
	}
	
	// 아이디 찾기
	public Member findId(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findId", member);
	}
	
	// 메일보내기 전 Cert테이블에 추가
	public void sendMail(SqlSessionTemplate sqlSession, Cert cert) {
		sqlSession.insert("memberMapper.sendMail", cert);
	}
	
	// 비밀번호 변경 시 메일 인증번호 요청
	public int findPwdMailRequest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findPwdMailRequest", member);
	}

	// 인증번호 확인
	public boolean certNumCheck(SqlSessionTemplate sqlSession, Cert cert) {
		Cert result = sqlSession.selectOne("memberMapper.certNumCheck", cert);
		if (result != null) {
			sqlSession.delete("memberMapper.remove", cert);
		}
		return result != null;
	}
	
	// 비밀번호 변경
	public int pwdChange(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.pwdChange", member);
	}

}
