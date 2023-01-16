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
	
	// 배틀풀 리스트 조회
	@Override
	public ArrayList<Battle> selectBattlePoolList(String cpage) {
		return battleDao.selectBattlePoolList(sqlSession, cpage);
	}
	// 배틀풀 리스트 검색
	@Override
	public ArrayList<Battle> searchBattle(HashMap<String, String> condition) {
		return battleDao.searchBattle(sqlSession, condition);
	}
	// 배틀풀 작성
	// BATTLE 테이블에 INSERT & POOL_INFO 테이블에 INSERT
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
		return battleDao.applyBattle(sqlSession, apply) * battleDao.msg(sqlSession, apply);
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
	@Override
	public int insertBattleResult(BattleResult br) {
		return battleDao.insertBattleResult(sqlSession, br);
	}
	@Override
	@Transactional
	public int battleResultOk(int battleNo, String victoryTeamNo, String defeatTeamNo) {
		return battleDao.battleResultOk(sqlSession, battleNo) * battleDao.updateVictoryTeam(sqlSession, victoryTeamNo) * battleDao.updateDefeatTeam(sqlSession, defeatTeamNo);
	}

	@Override
	@Transactional
	public int cancelBattle(HashMap<String, String> cancel) {
		return battleDao.cancelBattle(sqlSession, cancel.get("battleNo")) * battleDao.msg(sqlSession, cancel);
	}
	// FK 제약 조건 때문에 POOL_INFO 테이블 ResultSet을 먼저 삭제하고 BATTLE 테이블의 ResultSet을 삭제해야 함
	@Override
	@Transactional
	public int deleteBattlePool(int battleNo) {
		return battleDao.deletePoolInfo(sqlSession, battleNo) * battleDao.deleteBattlePool(sqlSession, battleNo);
	}
	@Override
	public int updateBattleResult(BattleResult br) {
		return battleDao.updateBattleResult(sqlSession, br);
	}

	
	

}
