package com.kh.cntp.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.dao.MemberDao;
import com.kh.cntp.member.model.vo.Cert;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.member.model.vo.Point;
import com.kh.cntp.moim.model.vo.Group;

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
	
	// 아이디 중복체크
	@Override
	public int ajaxIdCheck(String checkId) {
		return memberDao.ajaxIdCheck(sqlSession, checkId);
	}
	
	// 닉네임 중복체크
	@Override
	public int ajaxNickNameCheck(String checkNickName) {
		return memberDao.ajaxNickNameCheck(sqlSession, checkNickName);
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
	public int ajaxfindPwdMailRequest(Member member) {
		return memberDao.ajaxfindPwdMailRequest(sqlSession, member);
	}
	
	// 인증번호 확인
	@Override
	public boolean ajaxcertNumCheck(Cert cert) {
		return memberDao.ajaxcertNumCheck(sqlSession, cert);
	}
	
	// 비밀번호 변경
	@Override
	public int pwdChange(Member member) {
		return memberDao.pwdChange(sqlSession, member);
	}

		
	//////////////////////////////////
	// 마이페이지 						//
	//////////////////////////////////
	
	// 회원정보 수정
	@Override
	public int myPageInfoUpdate(Member member) {
		return memberDao.myPageInfoUpdate(sqlSession, member);
	}
	
	// 회원 탈퇴
	@Override
	public int myPageDelete(Member member) {
		return memberDao.myPageDelete(sqlSession, member);
	}
	
	// 포인트 내역 개수 조회
	@Override
	public int selectPointCount(Point point) {
		return memberDao.selectPointCount(sqlSession, point);
	}
	
	// 포인트 내역 조회
	@Override
	public ArrayList<Point> selectPointList(PageInfo pi, Point point) {
		return memberDao.selectPointList(sqlSession, pi, point);
	}
	
	// 내가 작성한 게시글 개수
	@Override
	public int selectMyBoardCount(Board board) {
		return memberDao.selectMyBoardCount(sqlSession, board);
	}
	
	// 내가 작성한 게시글 조회
	@Override
	public ArrayList<Board> selectMyBoardList(PageInfo pi, Board board) {
		return memberDao.selectMyBoardList(sqlSession, pi, board);
	}
	
	// 출석 내역 조회
	@Override
	public ArrayList<Point> selectAtCheck(int memNo) {
		return memberDao.selectAtCheck(sqlSession, memNo);
	}
	
	// 출석체크 개수
	@Override
	public int countAtCheck(int memNo) {
		return memberDao.countAtCheck(sqlSession, memNo);
	}
	
	// 출석체크
	@Override
	@Transactional
	public int insertAtCheck(Point point) {
		return memberDao.insertAtCheck(sqlSession, point) * memberDao.updatePointMember(sqlSession, point);
	}
	
	// 소모임 조회
	@Override
	public ArrayList<Group> myPageGroupList(int memNo) {
		return memberDao.myPageGroupList(sqlSession, memNo);
	}



	
	
	//////////////////////////////////
	// 인기도							//
	//////////////////////////////////
	// 회원 프로필 조회
	@Override
	public Member showProfile(int memNo) {
		return memberDao.showProfile(sqlSession, memNo);
	}

	@Override
	public int checkIngido(String ingido) {
		return memberDao.checkIngido(sqlSession, ingido);
	}

	@Override
	@Transactional
	public int upOrDownIngido(HashMap<String, String> map) {
		return memberDao.upOrDownIngido(sqlSession, map) * memberDao.insertIngidoRecord(sqlSession, map);
	}

	
	



	


	
}
