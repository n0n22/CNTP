package com.kh.cntp.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.member.model.vo.NaverVO;
import com.kh.cntp.member.model.vo.Point;
import com.kh.cntp.moim.model.vo.Group;

@Repository
public class MemberDao {
	
	// 네이버 로그인 이메일체크
	public int naverEmailCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.naverEmailCheck", email);
	}

	// 네이버 로그인 추가
	public int naverInsert(SqlSessionTemplate sqlSession, NaverVO naver) {
		return sqlSession.insert("memberMapper.naverInsert", naver);
	}
	
	// 네이버 로그인 확인
	public NaverVO loginNaverMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.loginNaverMember", email);
	}
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}
	
	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	// 아이디 중복체크
	public int ajaxIdCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.ajaxIdCheck", checkId);
	}
	
	// 닉네임 중복체크
	public int ajaxNickNameCheck(SqlSessionTemplate sqlSession, String checkNickName) {
		return sqlSession.selectOne("memberMapper.ajaxNickNameCheck", checkNickName);
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
	public int ajaxfindPwdMailRequest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.ajaxfindPwdMailRequest", member);
	}

	// 인증번호 확인
	public boolean ajaxcertNumCheck(SqlSessionTemplate sqlSession, Cert cert) {
		Cert result = sqlSession.selectOne("memberMapper.ajaxcertNumCheck", cert);
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
	
	// 내가 작성한 게시글 개수
	public int selectMyBoardCount(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.selectOne("memberMapper.selectMyBoardCount", board);
	}
	
	// 내가 작성한 게시글 조회
	public ArrayList<Board> selectMyBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Board board) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyBoardList", board, rowBounds);
	}
	
	// 출석 내역 조회
	public ArrayList<Point> selectAtCheck(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAtCheck", memNo);
	}
		
	// 출석체크 개수
	public int countAtCheck(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.countAtCheck", memNo);
	}
	
	// 출석체크 (포인트테이블추가)
	public int insertAtCheck(SqlSessionTemplate sqlSession, Point point) {
		return sqlSession.insert("memberMapper.insertAtCheck", point);
	}
	
	// 출석체크 (멤버 테이블 업데이트)
	public int updatePointMember(SqlSessionTemplate sqlSession, Point point) {
		return sqlSession.update("memberMapper.updatePointMember", point);
	}
	
	// 소모임 조회
	public ArrayList<Group> myPageGroupList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.myPageGroupList", memNo);
	}
		
		
		
	
	//////////////////////////////////
	// 인기도							//
	//////////////////////////////////
	
	// 회원 프로필 조회
	public Member showProfile(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.showProfile", memNo);
	}
	// 인기도 변경
	public int upOrDownIngido(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.upOrDownIngido", map);
	}
	// 인기도 변경 기록 저장
	public int insertIngidoRecord(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("memberMapper.insertIngidoRecord", map);
	} 
	// 지역별 인기도 왕 리스트 조회
	public ArrayList<Member> areaIngidoRank(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("memberMapper.areaIngidoRank");
	}
	// 전체 인기도 랭킹 리스트 조회
	public ArrayList<Member> allIngidoRank(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("memberMapper.allIngidoRank");
	}
}
