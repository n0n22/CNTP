package com.kh.cntp.battle.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.battle.model.dao.BattleDao;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;

@Service
public class BattleServiceImpl implements BattleService{
	@Autowired
	private BattleDao battleDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public String selectTeamNo(int memNo) {
		return battleDao.selectTeamNo(sqlSession, memNo);
	}
	@Override
	@Transactional
	public int insertBattle(Battle battle, PoolInfo poolInfo) {
		battleDao.insertBattle(sqlSession, battle);
		return battleDao.insertPoolInfo(sqlSession, poolInfo);
	}

	
	

}
