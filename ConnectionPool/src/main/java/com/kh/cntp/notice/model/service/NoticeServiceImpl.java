package com.kh.cntp.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.dao.NoticeDao;
import com.kh.cntp.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 공지사항 목록 개수 조회
	@Override
	public int selectListCount(String cate) {
		return noticeDao.selectListCount(sqlSession, cate);
	}


	// 공지사항 목록 조회
	@Override
	public ArrayList<Notice> selectList(String cate, PageInfo pi) {
		return noticeDao.selectList(sqlSession, cate, pi);
	}

	// 공지사항 조회수 증기
	@Override
	public int increaseCount(int nno) {
		return noticeDao.increaseCount(sqlSession, nno);
	}
	
	
	
	// 공지사항 상세 조회
	@Override
	public Notice selectDetail(int nno) {
		return noticeDao.selectDetail(sqlSession, nno);
	}



	
	
	
	
	
}
