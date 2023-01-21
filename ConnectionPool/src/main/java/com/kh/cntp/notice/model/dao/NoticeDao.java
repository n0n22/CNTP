package com.kh.cntp.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	// 공지사항 목록 개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("noticeMapper.selectListCount", map);
	}
	
	// 공지사항 목록 개수 조회
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", map, rowBounds);
	}
	
	
	// 공지사항 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.increaseCount", nno);
	}
	
	
	// 공지사항 상세 조회
	public Notice selectDetail(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.selectDetail", nno);
	}
	
	
	
	
	
}
