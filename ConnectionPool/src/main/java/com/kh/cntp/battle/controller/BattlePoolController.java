package com.kh.cntp.battle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BattlePoolController {
	
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
	
	// 배틀풀 작성
	@RequestMapping("enrollForm.bt")
	public String enrollForm() {
		return "battle/battlePoolEnrollForm";
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
