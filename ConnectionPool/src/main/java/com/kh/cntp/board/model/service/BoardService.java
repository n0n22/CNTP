package com.kh.cntp.board.model.service;

import java.util.ArrayList;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.reply.model.vo.Reply;


public interface BoardService {
	
	//게시글 리스트 조회 서비스 + 페이징 처리(select)
		//게시글 총 개수 조회
		int selectListCount();
		
		//게시글 리스트 조회
		ArrayList<Board> selectList(PageInfo pi);
		
		//게시글 작성하기 서비스(insert)
		int insertBoard(Board b);
		
		//게시글 상세 조회 서비스
		//게시글 조회수 증가(update)
		int increaseCount (int boardNo);
		
		//게시글 상세조회(select)
		Board selectBoard(int boardNo);
		
		//게시글 삭제 서비스(update)
		int deleteBoard(int boardNo);
		
		//게시글 수정 서비스(update)
		int updateBoard(Board b);
		
		//댓글 리스트 조회 서비스(Ajax)(select)
		ArrayList<Reply> selectReplyList (int boardNO);
		
		//댓글 작성 서비스 (Ajax) (insert)
		int insertReply(Reply r);
		
		
	
	
	
	
	
	
	
	
	
	
}
