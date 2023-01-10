package com.kh.cntp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.admin.model.vo.Banner;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.vo.Notice;

@Repository
public class AdminDao {

	
	
	

//-------------------------------------------
//  회원 관련 기능 
//-------------------------------------------
	

	
	

	
	
//-------------------------------------------
// 신고 관련 기능 
//-------------------------------------------	
	

	

	
	
	
	
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
