package com.kh.cntp.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.reply.model.vo.Reply;
@Repository
public class ReplyDao {
	
	
	/*
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopBoardList");
	}
	

	*/
	
	
}
