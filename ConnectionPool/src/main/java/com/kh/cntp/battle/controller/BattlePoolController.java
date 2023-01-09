package com.kh.cntp.battle.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cntp.battle.model.service.BattleService;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
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
	public String selectBattleResult(int battleNo
									,String homeTeam
									,String awayTeam
									,Model model
									,HttpSession session) {
		
		session.setAttribute("homeTeam", battleService.selectTeam(homeTeam));
		session.setAttribute("awayTeam", battleService.selectTeam(awayTeam));
		BattleResult battleResult = battleService.selectBattleResult(battleNo);
		System.out.println(battleResult);
		session.setAttribute("battleResult", battleService.selectBattleResult(battleNo));
		
		return "battle/battleResultDetail";
	}
	// 배틀결과 작성
	@RequestMapping("resultEnrollForm.bt")
	public String resultEnrollForm() {
		return "battle/battlePoolResultEnrollForm";
	}
	// 배틀 신청
	@RequestMapping("battleApply.bt")
	public String applyBattle(String teamNo
							 ,String memNo
							 ,String chatContent
							 ,String battleNo
							 ,HttpSession session
							 ,Model model
							 ,RedirectAttributes redirectAttributes) {
		
		HashMap<String, String> apply = new HashMap();
		apply.put("teamNo", teamNo);
		apply.put("memNo", memNo);
		apply.put("chatContent", chatContent);
		apply.put("battleNo", battleNo);
		
		int result = battleService.applyBattle(apply);
		
		if(result > 0) {
			redirectAttributes.addAttribute("battleNo", battleNo);
			session.setAttribute("alertMsg", "배틀 신청이 완료되었습니다.");
			return "redirect: battleDetail.bt";
		} else {
			model.addAttribute("errorMsg", "배틀 신청 실패");
			return "common/errorPage";
		}
	} 

}
