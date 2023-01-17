package com.kh.cntp.battle.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.vo.Team;

@Repository
public class BattleDao {
	// 배틀풀 리스트 조회
	public ArrayList<Battle> selectBattlePoolList(SqlSession sqlSession, String cpage){
		return (ArrayList)sqlSession.selectList("battleMapper.selectBattlePoolList", cpage);
	}
	// 배틀풀 리스트 검색 
	public ArrayList<Battle> searchBattle(SqlSessionTemplate sqlSession, HashMap<String, String> condition){
		return (ArrayList)sqlSession.selectList("battleMapper.searchBattle", condition);
	}
	// 배틀풀 작성 : BATTLE 테이블에 INSERT
	public int insertBattle(SqlSessionTemplate sqlSession, Battle battle) {
		return sqlSession.insert("battleMapper.insertBattle", battle);
	}
	// 배틀풀 작성 : POOL_INFO 테이블에 INSERT
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
	public int msg(SqlSessionTemplate sqlSession, HashMap<String, String> msg) {
		return sqlSession.insert("battleMapper.msg", msg);
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
	public int insertBattleResult(SqlSessionTemplate sqlSession, BattleResult br) {
		return sqlSession.insert("battleMapper.insertBattleResult", br);
	}
	public int battleResultOk(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.update("battleMapper.battleResultOk", battleNo);
	}
	public int updateVictoryTeam(SqlSessionTemplate sqlSession, String victoryTeamNo) {
		return sqlSession.update("battleMapper.updateVictoryTeam", victoryTeamNo);
	}
	public int updateDefeatTeam(SqlSessionTemplate sqlSession, String defeatTeamNo) {
		return sqlSession.update("battleMapper.updateDefeatTeam", defeatTeamNo);
	}

	public int cancelBattle(SqlSessionTemplate sqlSession, String battleNo) {
		return sqlSession.update("battleMapper.cancelBattle", battleNo);
	}
	public int deletePoolInfo(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.delete("battleMapper.deletePoolInfo", battleNo);
	}
	public int deleteBattlePool(SqlSessionTemplate sqlSession, int battleNo) {
		return sqlSession.delete("battleMapper.deleteBattlePool", battleNo);
	}
	public int updateBattleResult(SqlSessionTemplate sqlSession, BattleResult br) {
		return sqlSession.update("battleMapper.updateBattleResult", br);
	}
	public int checkBattle(SqlSessionTemplate sqlSession, String battleNo) {
		return sqlSession.selectOne("battleMapper.checkBattle", battleNo);
	}
}