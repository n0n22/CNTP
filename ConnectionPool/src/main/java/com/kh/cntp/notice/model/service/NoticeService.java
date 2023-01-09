package com.kh.cntp.notice.model.service;

import java.util.ArrayList;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.vo.Notice;

public interface NoticeService {

	
	// 공지사항 목록 개수 조회
	int selectListCount(String cate);
	
	
	// 공지사항 목록 조회
	ArrayList<Notice> selectList(String cate, PageInfo pi);
	
	
	
}
