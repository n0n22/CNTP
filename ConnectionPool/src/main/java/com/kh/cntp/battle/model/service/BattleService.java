package com.kh.cntp.battle.model.service;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;

public interface BattleService {
	
	/*
	 * 배틀풀 작성
	 */
	// 1. 팀 번호 조회
	String selectTeamNo(int memNo);
	// 2. BATTLE 테이블에 INSERT & POOLINFO에 INSERT
	int insertBattle(Battle battle, PoolInfo poolInfo);

}
