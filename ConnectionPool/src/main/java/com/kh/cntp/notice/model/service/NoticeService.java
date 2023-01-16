package com.kh.cntp.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.vo.Notice;

public interface NoticeService {

	
	// 공지사항 목록 개수 조회
	int selectListCount(HashMap map);
	
	
	// 공지사항 목록 조회
	ArrayList<Notice> selectList(HashMap map, PageInfo pi);
	
	// 공지사항 조회수 증가
	int increaseCount(int nno);
	
	
	// 공지사항 상세 조회
	Notice selectDetail(int nno);
	
	
}
