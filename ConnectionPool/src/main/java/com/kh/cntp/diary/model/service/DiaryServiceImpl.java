package com.kh.cntp.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.diary.model.dao.DiaryDao;
import com.kh.cntp.diary.model.vo.Diary;
import com.kh.cntp.reply.model.vo.Reply;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao diaryDao;
<<<<<<< HEAD

=======
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
	
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

<<<<<<< HEAD
	
=======
>>>>>>> 3a2e47dcab83363e8ec61c11a54056b0e58f17bf
	
	
	

	
	
	
	
	
	
}
