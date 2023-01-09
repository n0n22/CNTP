package com.kh.cntp.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
