package com.kh.cntp.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.diary.model.dao.DiaryDao;
import com.kh.cntp.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao diaryDao;

	
	@Override
	public ArrayList<Diary> selectList() {
		return diaryDao.selectList(sqlSession);
	}

	@Override
	public int insertDiary(Diary d) {
		
		return diaryDao.insertDiary(sqlSession, d);
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		
		return diaryDao.selectDiary(sqlSession, diaryNo);
	}

	@Override
	public int deleteDiary(int diaryNo) {
		
		return diaryDao.deleteDiary(sqlSession,diaryNo );
	}

	@Override
	public int updateDiary(Diary d) {
		
		return diaryDao.updateDiary(sqlSession, d);
	}

	
	
	
	
	
	
	
	
}
