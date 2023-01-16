package com.kh.cntp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.vo.TeamMember;
import com.kh.cntp.notice.model.vo.Notice;

@Repository
public class AdminDao {

	
	
	

//-------------------------------------------
//  회원 관련 기능 
//-------------------------------------------
	
	// 회원 목록 개수 조회
	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberListCount");
	}
	
	// 회원 목록 조회
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, HashMap map) {
		PageInfo pi = (PageInfo)map.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", map, rowBounds);
	}
	
	
	// 검색한 회원 목록 개수 조회
	public int selectSearchMemberListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("adminMapper.selectSearchMemberListCount", map);
	}
	
	// 검색한 회원 목록 조회
	public ArrayList<Member> selectSearchMemberList(SqlSessionTemplate sqlSession, HashMap map) {
		PageInfo pi = (PageInfo)map.get("pi");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchMemberList", map, rowBounds);
	}
	
	// 회원 전체 목록 조회
	public ArrayList<Member> allMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.allMemberList");
	}
	

	
	
//-------------------------------------------
// 신고 관련 기능 
//-------------------------------------------	
	
	
	// 신고 목록 개수 조회
	public int selectReportListCount(SqlSessionTemplate sqlSession, String result) {
		return sqlSession.selectOne("adminMapper.selectReportListCount", result);
	}
	
	
	// 신고 목록 조회
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi, String result) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReportList", result, rowBounds);
	}
	
	
	// 신고 상세 조회
	public Report selectReport(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("adminMapper.selectReport", rno);
	}
	
	
	
	
	// 신고 등록 - REPORT insert : 신고글 등록
	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("adminMapper.insertReport", report);
	}
	
	
	// 신고 등록 - BOARD update : 게시글 상태 업데이트
	public int updateBoardStatus(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.updateBoardStatus", boardNo);
	}
	
	
	// 신고 무효 - REPORT update
	public int invalidReport(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.update("adminMapper.invalidReport", reportNo);
	}
	
	// 신고 무효 - BOARD update : 게시글 상태 되돌리기
	public int reUpdateBoardStatus(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.reUpdateBoardStatus", boardNo);
	}
	
	
	// 신고 확정 - REPORT update
	public int confirmReport(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.update("adminMapper.confirmReport", reportNo);
	}
	
	
	
	// 패널티 목록 개수 조회
	public int selectPenaltyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectPenaltyListCount");
	}
	
	
	// 패널티 목록 조회
	public ArrayList<Report> selectPenaltyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectPenaltyList", null, rowBounds);
	}
	
	
	// 정지 처리
//	public int stopMember(SqlSessionTemplate sqlSession, ArrayList<Integer> stopList) {
//		return sqlSession.insert("adminMapper.stopMember", stopList);
//	}
	
	
	// 정지 처리된 적 있는지 조회
	public int selectStopPenalty(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("adminMapper.selectStopPenalty", memNo);
	}
	
	// 정지 날짜 업데이트
	public int updateStopPenalty(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.updateStopPenalty", memNo);
	}
	
	// 정지 날짜 인서트
	public int insertStopPenalty(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.insert("adminMapper.insertStopPenalty", memNo);
	}
	
	// 팀 멤버 정보 조회 
//	public ArrayList<TeamMember> selectTeamMem(SqlSessionTemplate sqlSession, int memNo) {
//		return (ArrayList)sqlSession.selectList("adminMapper.selectTeamMem", memNo);
//	}
	public TeamMember selectTeamMem(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("adminMapper.selectTeamMem", memNo);
	}
	
	
	// 바꿀 팀원이 있을때 팀장으로 업데이트
	public int updateTeamLeader(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.updateTeamLeader", memNo);
	}
	
	
	// 팀 상태 변경
	public int updateTeamStatus(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.updateTeamStatus", memNo);
	}	
		
	
	// 팀멤버 테이블에서 삭제
	public int deleteTeamMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.delete("adminMapper.deleteTeamMember", memNo);
	}
	
	
	// 강퇴 멤버 상태 변경
	public int updateMemberStatus(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.updateMemberStatus", memNo);
	}
	
	
//	// 부리더를 리더로
//	public int updateSubLeader(SqlSessionTemplate sqlSession, int sl) {
//		return sqlSession.update("adminMapper.updateSubLeader", sl);
//	}
	
	
	
	
//-------------------------------------------
// 배너 관련 기능 
//-------------------------------------------	
	
	// 배너 목록 개수 조회
	public int selectBannerListCount(SqlSessionTemplate sqlSession, String status) {
		return sqlSession.selectOne("adminMapper.selectBannerListCount", status);
	}
	
	// 배너 목록 조회
	public ArrayList<Banner> selectBannerList(SqlSessionTemplate sqlSession, String status, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBannerList", status, rowBounds);		
	}
	
	// 배너 등록
	public int insertBanner(SqlSessionTemplate sqlSession, Banner banner) {
		return sqlSession.insert("adminMapper.insertBanner", banner);
	}
	
	
	// 배너 수정
	public int updateBanner(SqlSessionTemplate sqlSession, Banner banner) {
		return sqlSession.update("adminMapper.updateBanner", banner);
	}
	
	
	// 메인페이지 배너 조회
	public ArrayList<Banner> selectMainBannerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMainBannerList");
	}
	
	
	
//-------------------------------------------
// 공지 관련 기능 
//-------------------------------------------
	
	// 공지사항 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("adminMapper.insertNotice", notice);
	}
	
	// 공지사항 수정
	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("adminMapper.updateNotice", notice);
	}
	
	// 공지사항 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("adminMapper.deleteNotice", nno);
	}
	
	
	
}
