package com.kh.cntp.battle.model.service;

import java.util.ArrayList;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;

public interface BattleService {
	
	
	ArrayList<Battle> selectBattle();
	
	// 배틀풀 작성 BATTLE 테이블에 INSERT & POOLINFO에 INSERT
	int insertBattle(Battle battle, PoolInfo poolInfo);

}
