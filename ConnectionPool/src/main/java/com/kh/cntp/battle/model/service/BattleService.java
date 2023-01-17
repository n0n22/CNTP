package com.kh.cntp.battle.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.moim.model.vo.Team;

public interface BattleService {
	
	// 배틀풀 리스트 조회
	ArrayList<Battle> selectBattlePoolList(String cpage);
	
	// 배틀풀 리스트 검색
	ArrayList<Battle> searchBattle(HashMap<String, String> condition);

	// 배틀풀 작성
	int insertBattle(Battle battle, PoolInfo poolInfo);
	
	// 배틀풀 경기 정보 상세보기
	Battle selectBattle(int battleNo);
	
	// 배틀풀 경기장 정보 상세보기
	PoolInfo selectPoolInfo(int battleNo);
	
// 배틀 신청
	int applyBattle(HashMap<String, String> apply);
	
	// 팀 정보 조회
	Team selectTeam(String team);
	// 배틀 결과 조회
	BattleResult selectBattleResult(int battleNo);
	// 팀 전적 조회
	ResultHistory selectResultHistory(String team);
	
// 배틀 결과 작성
	int insertBattleResult(BattleResult br);
	
// 배틀 결과 승인
	int battleResultOk(int battleNo, String victoryTeamNo, String defeatTeamNo);
	
// 배틀 신청 취소
	int cancelBattle(HashMap<String, String> cancel);
// 배틀 삭제
	int deleteBattlePool(int battleNo);

// 배틀 결과 수정
	int updateBattleResult(BattleResult br);
// 배틀 신청 중복 확인
	int checkBattle(String battleNo);
	
	
// topN
	ArrayList<ResultHistory> selectListManyWin();
	

}
