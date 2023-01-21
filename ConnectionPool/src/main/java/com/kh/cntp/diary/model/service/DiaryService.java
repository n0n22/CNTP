package com.kh.cntp.diary.model.service;

import java.util.ArrayList;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.diary.model.vo.Diary;
import com.kh.cntp.reply.model.vo.Reply;

public interface DiaryService {
	
<<<<<<< HEAD
	
=======

>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
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
	

	
	
<<<<<<< HEAD
	//댓글 리스트 조회서비스(Ajax)(select)
	ArrayList<Reply> selectReplyList(int DiaryNo);
		
	// 댓글 작성 서비스 (Ajax)(insert)
	int insertReply(Reply r);
	*/
=======
>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
	
	
}
