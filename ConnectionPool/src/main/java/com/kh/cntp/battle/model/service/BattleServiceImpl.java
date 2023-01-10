package com.kh.cntp.battle.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cntp.battle.model.dao.BattleDao;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.vo.Team;

@Service
public class BattleServiceImpl implements BattleService{
	
	@Autowired
	private BattleDao battleDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// BATTLE 조회
	@Override
	public ArrayList<Battle> selectBattle() {
		// TODO Auto-generated method stub
		return null;
	}
	// BATTLE 테이블에 INSERT & POOLINFO에 INSERT
	@Override
	@Transactional
	public int insertBattle(Battle battle, PoolInfo poolInfo) {
		return battleDao.insertBattle(sqlSession, battle) * battleDao.insertPoolInfo(sqlSession, poolInfo);
	}
	
	@Override
	public Battle selectBattle(int battleNo) {
		return battleDao.selectBattle(sqlSession, battleNo);
	}
	@Override
	public PoolInfo selectPoolInfo(int battleNo) {
		return battleDao.selectPoolInfo(sqlSession, battleNo);
	}
	@Override
	@Transactional
	public int applyBattle(HashMap<String, String> apply) {
		return battleDao.applyBattle(sqlSession, apply) * battleDao.provokeMsg(sqlSession, apply);
	}
	@Override
	public Team selectTeam(String team) {
		return battleDao.selectTeam(sqlSession, team);
	}
	@Override
	public BattleResult selectBattleResult(int battleNo) {
		return battleDao.selectBattleResult(sqlSession, battleNo);
	}
	@Override
	public ResultHistory selectResultHistory(String teamNo) {
		return battleDao.selectResultHistory(sqlSession, teamNo);
	}

	
	

}
