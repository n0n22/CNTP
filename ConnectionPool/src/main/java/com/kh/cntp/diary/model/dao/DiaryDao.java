package com.kh.cntp.diary.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.diary.model.vo.Diary;

@Repository
public class DiaryDao {

<<<<<<< HEAD
	
=======

>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
public ArrayList<Diary> selectList(SqlSessionTemplate sqlSession) {
	return (ArrayList)sqlSession.selectList("diaryMapper.selectList");
}
	
	
public int insertDiary(SqlSessionTemplate sqlSession, Diary d) {
	return sqlSession.insert("diaryMapper.insertDiary", d);

}


public Diary selectDiary(SqlSessionTemplate sqlSession, int diaryNo) {
	return sqlSession.selectOne("diaryMapper.selectDiary", diaryNo);

}
	
public int deleteDiary(SqlSessionTemplate sqlSession, int diaryNo) {
	return sqlSession.update("diaryMapper.deleteDiary", diaryNo);

}
	
public int updateDiary (SqlSessionTemplate sqlSession, Diary d) {
	return sqlSession.update("diaryMapper.updateDiary", d);
	
}


	
	
	
	
<<<<<<< HEAD
	
=======
>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
