package com.kh.cntp.diary.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.diary.model.dao.DiaryDao;
import com.kh.cntp.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao DiaryDao;
	/*
	@Override
	public ArrayList<Diary> selectList() {
		
		return DiaryDao;
	}

	@Override
	public int insertDiary(Diary d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		// TODO Auto-generated method stub
		return ;
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
	
	
	*/
	
	
	
	
}
