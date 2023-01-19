package com.kh.cntp.diary.model.service;

import java.util.ArrayList;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.diary.model.vo.Diary;
import com.kh.cntp.reply.model.vo.Reply;

public interface DiaryService {
	

	// 게시글 리스트 조회 서비스 + 페이징 처리(select)
	// 게시글 총 개수 조회
	//int selectListCount(); // 리스트만 가져오면 되기때문에 count를 할 필요없다.
	// 게시글 리스트 조회
	ArrayList<Diary> selectList();
	
	// 게시글 작성하기 서비스(insert)
	int insertDiary(Diary d);


	// 게시글 상세 조회(select)
	Diary selectDiary(int diaryNo);
	
	// 게시글 삭제 서비스(update)
	int deleteDiary(int diaryNo);
	
	// 게시글 수정 서비스(update)
	int updateDiary(Diary d);
	

	
	
	
}
