package com.kh.cntp.battle.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.moim.model.vo.Team;

public interface BattleService {
	
	
	ArrayList<Battle> selectBattle();
	
	// 배틀풀 작성 BATTLE 테이블에 INSERT & POOLINFO에 INSERT
	int insertBattle(Battle battle, PoolInfo poolInfo);
	
	// 배틀풀 조회
	Battle selectBattle(int battleNo);
	
	PoolInfo selectPoolInfo(int battleNo);
	
	// 배틀 신청
	int applyBattle(HashMap<String, String> apply);
	
	// 배틀 결과
	// 1. 팀 정보 조회
	Team selectTeam(String team);
	// 2. 배틀 결과 조회
	BattleResult selectBattleResult(int battleNo);
	
	

}
