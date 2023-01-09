package com.kh.cntp.battle.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String selectBattlePool(int battleNo, Model model) {
		Battle battle = battleService.selectBattle(battleNo);
		PoolInfo poolInfo = battleService.selectPoolInfo(battleNo);
		model.addAttribute("battle", battle);
		model.addAttribute("poolInfo", poolInfo);
		
		return "battle/battlePoolDetail";
	}
	
	// 배틀풀 작성폼 보기
	@RequestMapping("enrollForm.bt")
	public String enrollForm() {
		return "battle/battlePoolEnrollForm";
	}
	@RequestMapping("insert.bt")
	public String insertBattle(Battle battle
							  ,PoolInfo poolInfo
							  ,MultipartFile upfile
							  ,HttpSession session
							  ,Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			battle.setOriginName(upfile.getOriginalFilename());
			battle.setChangeName("resources/upfiles/" + Template.saveFile(upfile, session));
		}
		int result = battleService.insertBattle(battle, poolInfo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "배틀풀 작성 성공");
			return "redirect: battleList.bt";
		} else {
			model.addAttribute("errorMsg", "배틀풀 작성 실패");
			return "common/errorPage";
		}
		
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
