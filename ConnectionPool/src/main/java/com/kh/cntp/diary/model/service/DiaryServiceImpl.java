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
	private DiaryDao DiaryDao;
	/*
	@Override
	public ArrayList<Diary> selectList(SqlSessionTemplate sqlSession, ) {
		
		return (ArrayList)sqlSesssion.selectList("diaryMapper.selectList", d);
	}

	@Override
	public int insertDiary(Diary d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDiary(int diaryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDiary(Diary d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Diary> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectDiary(int diaryNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	*/
	
	
	
	
	
}
