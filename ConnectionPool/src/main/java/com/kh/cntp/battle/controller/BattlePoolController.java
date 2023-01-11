package com.kh.cntp.battle.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.cntp.battle.model.service.BattleService;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.template.Template;
import com.kh.cntp.moim.model.vo.Team;

@Controller
public class BattlePoolController {
	@Autowired
	private BattleService battleService;
	
	
	// 배틀풀 리스트 조회
	@RequestMapping("battleList.bt")
	public String selectBattlePoolList(Model model,
									   @RequestParam(value ="cpage", defaultValue="today") String cpage) {
		
		if(cpage.equals("today")) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			cpage = df.format(new Date());
		}
		
		ArrayList<Battle> battleList = battleService.selectBattlePoolList(cpage);
		model.addAttribute("battleList", battleList);
		model.addAttribute("now", cpage);
		
		return "battle/battlePoolList";
	}
	// 배틀풀 상세보기
	@RequestMapping("battleDetail.bt")
	public String selectBattlePool(int battleNo, Model model) {
		Battle battle = battleService.selectBattle(battleNo);
		PoolInfo poolInfo = battleService.selectPoolInfo(battleNo);
		ResultHistory homeTeamRecord = battleService.selectResultHistory(battle.getHomeTeam());
		
		model.addAttribute("homeTeamRecord", homeTeamRecord);
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
	public String insertBattle(Battle battle,
							   PoolInfo poolInfo,
							   MultipartFile upfile,
							   HttpSession session,
							   Model model) {
		System.out.println(battle);
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
	public String selectBattleResult(int battleNo,
									 String homeTeam,
									 String awayTeam,
									 Model model,
									 HttpSession session) {
		
		session.setAttribute("battleNo", battleNo);
		session.setAttribute("homeTeam", battleService.selectTeam(homeTeam));
		session.setAttribute("homeTeamHistory", battleService.selectResultHistory(homeTeam));
		session.setAttribute("awayTeam", battleService.selectTeam(awayTeam));
		session.setAttribute("awayTeamHistory", battleService.selectResultHistory(awayTeam));
		session.setAttribute("battleResult", battleService.selectBattleResult(battleNo));
		
		return "battle/battleResultDetail";
	}
	// 배틀결과 작성
	@RequestMapping("resultEnrollForm.bt")
	public String resultEnrollForm(int battleNo,
								   String homeTeam,
								   String awayTeam,
								   Model model,
								   HttpSession session) {
		
		session.setAttribute("battleNo", battleNo);
		session.setAttribute("homeTeam", battleService.selectTeam(homeTeam));
		session.setAttribute("awayTeam", battleService.selectTeam(awayTeam));
		
		return "battle/battlePoolResultEnrollForm";
	}
	// 배틀 신청
	@RequestMapping("battleApply.bt")
	public String applyBattle(String teamNo,
							  String memNo,
							  String chatContent,
							  String battleNo,
							  HttpSession session,
							  Model model,
							  RedirectAttributes redirectAttributes) {
		
		HashMap<String, String> apply = new HashMap<String, String>();
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
	// 배틀 결과 작성
	@RequestMapping("insertBattleResult.bt")
	public String insertBattleResult(BattleResult br, 
									 Model model,
									 RedirectAttributes redirectAttributes) {
		System.out.println(br);
		int result = battleService.insertBattleResult(br);
		
		if(result > 0) {
			redirectAttributes
			.addAttribute("battleNo", br.getBattleNo());
			return "redirect: battleDetail.bt";
		} else {
			model.addAttribute("errorMsg", "배틀 결과 작성 실패");
			return "common/errorPage";
		}
		
	}
	// 배틀 결과 승인
	@RequestMapping("battleResultOk.bt")
	public String battleResultOk(int battleNo,
								 String victoryTeamNo,
								 String defeatTeamNo,
								 HttpSession session,
								 Model model,
								 RedirectAttributes redirectAttributes) {
		
		int result = battleService.battleResultOk(battleNo, victoryTeamNo, defeatTeamNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "배틀 결과 승인이 완료되었습니다.");
			redirectAttributes.addAttribute("battleNo", battleNo);
			return "redirect: battleDetail.bt";
		} else {
			model.addAttribute("errorMsg", "배틀 결과 승인 실패");
			return "common/errorPage";
		}
	}
	// 배틀 리스트 검색 
	@RequestMapping("search.bt")
	public String searchBattle(String cpage,
							   @RequestParam(value = "area", defaultValue="") String area,
							   @RequestParam(value = "gender", defaultValue="") String gender,
							   @RequestParam(value = "style", defaultValue="") String style,
							   @RequestParam(value = "level", defaultValue="") String level,
							   Model model) {
		//System.out.println("cpage" + cpage); // 빈문자열이 담긴 경우와 그외
		//System.out.println("area" + area);
		//System.out.println("gender" + gender);
		//System.out.println("style" + style);
		//System.out.println("level" + level);
		
		HashMap<String, String> condition = new HashMap<String, String>();
		condition.put("cpage", cpage);
		condition.put("area", area);
		condition.put("gender", gender);
		condition.put("style", style);
		condition.put("level", level);
		//System.out.println(condition);
		ArrayList<Battle> battleList = battleService.searchBattle(condition);
		//System.out.println(battleList);
		model.addAttribute("battleList", battleList);
		model.addAttribute("now", cpage);
		model.addAttribute("condition", condition);
		
		return "battle/battlePoolList";
		
	}
	
}
