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
	
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("adminMapper.insertNotice", notice);
	}
	
	
	
	
}
