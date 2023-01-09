package com.kh.cntp.battle.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;

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
}
