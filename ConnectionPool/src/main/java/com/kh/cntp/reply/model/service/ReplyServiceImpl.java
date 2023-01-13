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
	
	/*
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return replyDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return replyDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopBoard() {
		return replyDao.selectTopBoardList(sqlSession);
	}
	*/
	
}
