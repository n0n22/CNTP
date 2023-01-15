package com.kh.cntp.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.member.model.vo.Point;

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
	
	/////////////////////////////////
	// 마이페이지					   //
	/////////////////////////////////
	
	// 회원정보 변경
	public int myPageInfoUpdate(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.myPageInfoUpdate", member);
	}

	// 회원 탈퇴
	public int myPageDelete(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.myPageDelete", member);
	}
	
	// 포인트 내역 개수 조회
	public int selectPointCount(SqlSessionTemplate sqlSession, Point point) {
		return sqlSession.selectOne("memberMapper.selectPointCount", point);
	}
	
	// 포인트 내역 조회
	public ArrayList<Point> selectPointList(SqlSessionTemplate sqlSession, PageInfo pi, Point point) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectPointList", point, rowBounds);
	}
	
	//////////////////////////////////
	// 인기도							//
	//////////////////////////////////
	
	// 회원 프로필 조회
	public Member showProfile(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.showProfile", memNo);
	}


}
