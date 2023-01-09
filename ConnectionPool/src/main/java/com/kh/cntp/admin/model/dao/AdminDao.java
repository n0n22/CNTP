package com.kh.cntp.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.notice.model.vo.Notice;

@Repository
public class AdminDao {

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("adminMapper.insertNotice", notice);
	}
	
	
	
	
}
