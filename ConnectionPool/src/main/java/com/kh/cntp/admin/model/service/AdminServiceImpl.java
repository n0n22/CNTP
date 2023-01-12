package com.kh.cntp.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.admin.model.dao.AdminDao;
import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.admin.model.vo.Report;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.notice.model.vo.Notice;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
//-------------------------------------------
//  회원 관련 기능 
//-------------------------------------------
	
	// 회원 목록 개수 조회
	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount(sqlSession);
	}
	
	// 회원 목록 조회
	@Override
	public ArrayList<Member> selectMemberList(HashMap map) {
		return adminDao.selectMemberList(sqlSession, map);
	}
	
	
	// 검색한 회원 목록 개수 조회
	@Override
	public int selectSearchMemberListCount(HashMap map) {
		return adminDao.selectSearchMemberListCount(sqlSession, map);
	}
	
	// 검색한 회원 목록 조회
	@Override
	public ArrayList<Member> selectSearchMemberList(HashMap map) {
		return adminDao.selectSearchMemberList(sqlSession, map);
	}
	
	// 회원 전체 목록 조회
	@Override
	public ArrayList<Member> allMemberList() {
		return adminDao.allMemberList(sqlSession);
	}
	
	
	
	
	
	

	
	
//-------------------------------------------
// 신고 관련 기능 
//-------------------------------------------	
	
	// 신고 목록 개수 조회
	@Override
	public int selectReportListCount(String result) {
		return adminDao.selectReportListCount(sqlSession, result);
	}
	
	
	// 신고 목록 조회
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi, String result) {
		return adminDao.selectReportList(sqlSession, pi, result);
	}
	
	
	// 신고 상세 조회
	@Override
	public Report selectReport(int rno) {
		return adminDao.selectReport(sqlSession, rno);
	}
	
	
	
	
	
	
	// 신고 등록 : REPORT insert + BOARD update
	@Transactional
	@Override
	public int insertReport(Report report) {
		return adminDao.insertReport(sqlSession, report) * adminDao.updateBoardStatus(sqlSession, report.getBoardNo());
	}
	
	
	// 신고 무효 : REPORT update + BOARD update
	@Transactional
	@Override
	public int invalidReport(Report report) {
		return adminDao.invalidReport(sqlSession, report.getReportNo()) * adminDao.reUpdateBoardStatus(sqlSession, report.getBoardNo());
	}

	
	
	
	
//-------------------------------------------
// 배너 관련 기능 
//-------------------------------------------	

	// 배너 목록 개수 조회
	@Override
	public int selectBannerListCount(String status) {
		return adminDao.selectBannerListCount(sqlSession, status);
	}


	// 배너 목록 조회
	@Override
	public ArrayList<Banner> selectBannerList(String status, PageInfo pi) {
		return adminDao.selectBannerList(sqlSession, status, pi);
	}

	
	// 배너 등록
	@Override
	public int insertBanner(Banner banner) {
		return adminDao.insertBanner(sqlSession, banner);
	}
	

	// 배너 수정
	@Override
	public int updateBanner(Banner banner) {
		return adminDao.updateBanner(sqlSession, banner);
	}

	
	
	// 메인페이지 배너 조회
	@Override
	public ArrayList<Banner> selectMainBannerList() {
		return adminDao.selectMainBannerList(sqlSession);
	}
	
	
	
//-------------------------------------------
// 공지 관련 기능 
//-------------------------------------------

	// 공지사항 등록
	@Override
	public int insertNotice(Notice notice) {		
		return adminDao.insertNotice(sqlSession, notice);
	}



	// 공지사항 수정
	@Override
	public int updateNotice(Notice notice) {
		return adminDao.updateNotice(sqlSession, notice);
	}

	

	// 공지사항 삭제
	@Override
	public int deleteNotice(int nno) {
		return adminDao.deleteNotice(sqlSession, nno);
	}










	
	
	
	
	
	
	
	
	
}
