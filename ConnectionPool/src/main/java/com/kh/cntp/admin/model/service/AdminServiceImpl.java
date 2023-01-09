package com.kh.cntp.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.admin.model.dao.AdminDao;
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
	@Override
	public int insertNotice(Notice notice) {		
		return adminDao.insertNotice(sqlSession, notice);
	}



	// 공지사항 수정
	@Override
	public int updateNotice(Notice notice) {
		return adminDao.updateNotice(sqlSession, notice);
	}

	
	
	
	
	
	
	
	
	
}
