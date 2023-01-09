package com.kh.cntp.battle.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;

@Repository
public class BattleDao {
	
	public String selectTeamNo(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("battleMapper.selectTeamNo", memNo);
	}
	public int insertBattle(SqlSessionTemplate sqlSession, Battle battle) {
		return sqlSession.insert("battleMapper.insertBattle", battle);
	}
	public int insertPoolInfo(SqlSessionTemplate sqlSession, PoolInfo poolInfo){
		return sqlSession.insert("battleMapper.insertPoolInfo", poolInfo);
	}
}
