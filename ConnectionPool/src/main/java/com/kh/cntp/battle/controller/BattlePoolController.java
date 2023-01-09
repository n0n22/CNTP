package com.kh.cntp.battle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cntp.battle.model.service.BattleService;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.common.template.Template;

@Controller
public class BattlePoolController {
	@Autowired
	private BattleService battleService;
	
	
	// 배틀풀 리스트 조회
	@RequestMapping("battleList.bt")
	public String selectBattlePoolList() {
		return "battle/battlePoolList";
	}
	// 배틀풀 상세보기
	@RequestMapping("battleDetail.bt")
	public String selectBattlePool() {
		return "battle/battlePoolDetail";
	}
	
	// 배틀풀 작성폼 보기
	@RequestMapping("enrollForm.bt")
	public String enrollForm() {
		return "battle/battlePoolEnrollForm";
	}
	@RequestMapping("insert.bt")
	public String insertBattle(int memNo
							 , Battle battle
							 , PoolInfo poolInfo
							 , MultipartFile upfile
							 , HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			battle.setOriginName(upfile.getOriginalFilename());
			battle.setChangeName("resources/upfiles" + Template.saveFile(upfile, session));
		}
		// 1. 팀 번호 조회(SELECT) : memNo => 공통으로 하나로 합칠 수 있을 것 같음
		String teamNo = battleService.selectTeamNo(memNo);
		battle.setHomeTeam(teamNo);
		
		// 2. battle (INSERT, SEQ_BTNO.NEXTVAL) & poolInfo (INSERT, SEQ_BTNO.CURRVAL)
		int result = battleService.insertBattle(battle, poolInfo);
		// 서비스단에서 두 개를 호출
		// 2.3 하나의 트랜잭션 처리
		
		return "redirect: battleList.bt";
	}
	
	// 배틀풀 결과
	@RequestMapping("battleResult.bt")
	public String selectBattleResult() {
		return "battle/battleResultDetail";
	}
	// 배틀결과 작성
	@RequestMapping("resultEnrollForm.bt")
	public String resultEnrrolForm() {
		return "battle/battlePoolResultEnrollForm";
	}

}
