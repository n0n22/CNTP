package com.kh.cntp.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.reply.model.vo.Reply;
@Repository
public class ReplyDao {
	
	
	//Board 댓글 조회
	public ArrayList<Reply> BoardselectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("replyMapper.selectBoardReplyList", boardNo);
	}
	
	public int BoardinsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertBoardReply", r);
	}
	
	

	//수영일기 댓글 조회
	public ArrayList<Reply> DiaryselectReplyList(SqlSessionTemplate sqlSession, int diaryNo){
		return (ArrayList)sqlSession.selectList("replyMapper.selectDiaryReplyList", diaryNo);
	}
	
	public int DiaryinsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertDiaryReply", r);
	}
	
	
	
}
