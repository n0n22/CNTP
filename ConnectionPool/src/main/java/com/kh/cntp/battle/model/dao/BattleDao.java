package com.kh.cntp.battle.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.vo.Team;

@Repository
public class BattleDao {
	
	public int insertBattle(SqlSessionTemplate sqlSession, Battle battle) {
		return sqlSession.insert("battleMapper.insertBattle", battle);
	}
	public int insertPoolInfo(SqlSessionTemplate sqlSession, PoolInfo poolInfo){
		return sqlSession.insert("battleMapper.insertPoolInfo", poolInfo);
	}
	public Battle selectBattle(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.selectOne("battleMapper.selectBattle", battleNo);
	}
	public PoolInfo selectPoolInfo(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.selectOne("battleMapper.selectPoolInfo", battleNo);
	}
	public int applyBattle(SqlSessionTemplate sqlSession, HashMap<String, String> apply) {
		return sqlSession.update("battleMapper.applyBattle", apply);
	}
	public int provokeMsg(SqlSessionTemplate sqlSession, HashMap<String, String> apply) {
		return sqlSession.insert("battleMapper.provokeMsg", apply);
	}
	public Team selectTeam(SqlSessionTemplate sqlSession, String team) {
		return sqlSession.selectOne("battleMapper.selectTeam", team);
	}
	public BattleResult selectBattleResult(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.selectOne("battleMapper.selectBattleResult", battleNo);
	}
	public ResultHistory selectResultHistory(SqlSessionTemplate sqlSession, String teamNo) {
		return sqlSession.selectOne("battleMapper.selectResultHistory", teamNo);
	}
	
	
}
