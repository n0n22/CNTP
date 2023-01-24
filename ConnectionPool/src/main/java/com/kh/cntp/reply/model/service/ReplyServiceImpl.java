package com.kh.cntp.reply.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.reply.model.vo.Reply;
import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.reply.model.dao.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//board게시판
	
	@Override
	public ArrayList<Reply> BoardselectReplyList(int boardNo) {
		
		return replyDao.BoardselectReplyList(sqlSession, boardNo);
	}

	@Override
	public int BoardinsertReply(Reply r) {
		
		return  replyDao.BoardinsertReply(sqlSession, r);
	}
	
	
	
	


	
	
	//수영일기 댓글게시판
	
	@Override
	public ArrayList<Reply> DiaryselectReplyList(int diaryNo) {
		
		return replyDao.DiaryselectReplyList(sqlSession, diaryNo);
	}
	
	@Override
	public int DiaryinsertReply(Reply r) {
		
		return replyDao.DiaryinsertReply(sqlSession, r);
	}

	
}
