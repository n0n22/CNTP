package com.kh.cntp.battle.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.cntp.battle.model.service.BattleService;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.template.Template;

import oracle.net.aso.a;

@Controller
public class BattlePoolController {
	// 의존성 주입 : 필드 주입 
	// 주입하려고 하는 객체의 타입과 일치하는 객체를 자동으로 주입
	@Autowired
	private BattleService battleService;
	
	// 배틀풀 리스트 조회
	@RequestMapping("battleList.bt")
	public ModelAndView selectBattlePoolList(@RequestParam(value ="cpage", defaultValue="today") String cpage,
											 ModelAndView mv) {
		// 전달받은 날짜가 없으면 오늘 날짜를 기본값으로
		if(cpage.equals("today")) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			cpage = df.format(new Date());
		}
		// 요청한 날짜의 경기를 조회 후 ArrayList<Battle>에 담아 반환
		// HttpServletRequest의 attribute 영역에 담아주고 응답화면 지정
		mv.addObject("battleList", battleService.selectBattlePoolList(cpage))
		  .addObject("now", cpage)
		  .setViewName("battle/battlePoolList");
		
		return mv;
	}
	// 배틀풀 리스트 검색 
	@RequestMapping("search.bt")
	public ModelAndView searchBattle(String cpage,
								     @RequestParam(value = "area", defaultValue="") String area,
								     @RequestParam(value = "gender", defaultValue="") String gender,
								     @RequestParam(value = "style", defaultValue="") String style,
								     @RequestParam(value = "level", defaultValue="") String level,
								     ModelAndView mv) {
		// 동적 쿼리문을 위한 조건을 수행하기 위해 Map에 K, V 형태로 가공
		HashMap<String, String> condition = new HashMap<String, String>();
		condition.put("cpage", cpage);
		condition.put("area", area);
		condition.put("gender", gender);
		condition.put("style", style);
		condition.put("level", level);
		
		// 요청한 날짜 + 요청한 조건의 경기를 조회 후 ArrayList<Batlle>에 담아 반환
		// HttpServletRequest의 attribute 영역에 담아주고 응답화면 지정
		// 페이지 이동시에도 검색한 키워드 데이터를 계속 남기기 위해 condition 역시 attribute 영역에 저장
		mv.addObject("battleList", battleService.searchBattle(condition))
		  .addObject("now", cpage)
		  .addObject("condition", condition)
		  .setViewName("battle/battlePoolList");
		
		return mv;
	}
	// 배틀풀 작성폼 보기
	@RequestMapping("enrollForm.bt")
	public String enrollForm() {
		return "battle/battlePoolEnrollForm";
	}
	// 배틀풀 작성
	@RequestMapping("insert.bt")
	public ModelAndView insertBattle(Battle battle,
									 PoolInfo poolInfo,
									 MultipartFile upfile,
									 HttpSession session,
									 ModelAndView mv) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			battle.setOriginName(upfile.getOriginalFilename());
			battle.setChangeName("resources/upfiles/" + Template.saveFile(upfile, session));
		}
		
		if(battleService.insertBattle(battle, poolInfo) > 0) {
			session.setAttribute("alertMsg", "배틀풀 작성 성공");
			mv.setViewName("redirect: battleList.bt");
		} else {
			mv.addObject("errorMsg", "배틀풀 작성 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 배틀풀 상세보기 : 배틀풀 경기 정보 / 경기장 정보 / 팀 전적 / 경기 결과 조회
	@RequestMapping("battleDetail.bt")
	public ModelAndView selectBattlePool(int battleNo, ModelAndView mv) {

		Battle battle = battleService.selectBattle(battleNo);
		
		mv.addObject("battle", battle)
		  .addObject("poolInfo", battleService.selectPoolInfo(battleNo))
		  .addObject("homeTeamRecord", battleService.selectResultHistory(battle.getHomeTeam()))
		  .addObject("battleResult", battleService.selectBattleResult(battleNo))
		  .setViewName("battle/battlePoolDetail");
		
		return mv;
	}
	
	// 배틀풀 결과 : 홈팀 정보 / 홈팀 전적 / 어웨이팀 정보 / 어웨이팀 전적  / 배틀 결과
	@RequestMapping("battleResult.bt")
	public ModelAndView selectBattleResult(int battleNo,
										   String homeTeam,
										   String awayTeam,
										   ModelAndView mv
									 ) {
		mv.addObject("battleNo", battleNo)
		  .addObject("homeTeam", battleService.selectTeam(homeTeam))
		  .addObject("homeTeamHistory", battleService.selectResultHistory(homeTeam))
		  .addObject("awayTeam", battleService.selectTeam(awayTeam))
		  .addObject("awayTeamHistory", battleService.selectResultHistory(awayTeam))
		  .addObject("battleResult", battleService.selectBattleResult(battleNo))
		  .setViewName("battle/battleResultDetail");
		
		return mv;
	}
	
	// 배틀결과 작성폼 : 홈팀 정보, 어웨이팀 정보
	@RequestMapping("resultEnrollForm.bt")
	public ModelAndView resultEnrollForm(int battleNo,
									     String homeTeam,
									     String awayTeam,
									     ModelAndView mv) {
		
		mv.addObject("battleNo", battleNo)
		  .addObject("homeTeam", battleService.selectTeam(homeTeam))
		  .addObject("awayTeam", battleService.selectTeam(awayTeam))
		  .setViewName("battle/battlePoolResultEnrollForm");
		
		return mv;
	}
	
	// 배틀 신청
	@RequestMapping("battleApply.bt")
	public ModelAndView applyBattle(String teamNo,
							  String memNo,
							  String chatContent,
							  String battleNo,
							  HttpSession session,
							  ModelAndView mv,
							  RedirectAttributes redirectAttributes) {
		
		if(battleService.checkBattle(battleNo) > 0) {
			
			// map형태로 데이터 가공
			HashMap<String, String> apply = new HashMap<String, String>();
			apply.put("teamNo", teamNo);
			apply.put("memNo", memNo);
			apply.put("chatContent", chatContent);
			apply.put("battleNo", battleNo);
			
			if(battleService.applyBattle(apply) > 0) {
				redirectAttributes.addAttribute("battleNo", battleNo);
				session.setAttribute("alertMsg", "배틀 신청이 완료되었습니다.");
				mv.setViewName("redirect: battleDetail.bt");
			} else {
				mv.addObject("errorMsg", "배틀 신청 실패")
				.setViewName("common/errorPage");
			}
		} else {
			redirectAttributes.addAttribute("battleNo", battleNo);
			session.setAttribute("alertMsg", "이미 신청이 완료된 배틀입니다.");
			mv.setViewName("redirect: battleDetail.bt");
		}
		return mv;
	} 
	// 배틀 결과 작성
	@RequestMapping("insertBattleResult.bt")
	public ModelAndView insertBattleResult(BattleResult br, 
									 	   ModelAndView mv,
									 	   RedirectAttributes redirectAttributes) {
		int result = battleService.insertBattleResult(br);
		if(result > 0) {
			redirectAttributes.addAttribute("battleNo", br.getBattleNo());
			mv.setViewName("redirect: battleDetail.bt");
		} else {
			mv.addObject("errorMsg", "배틀 결과 작성 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	// 배틀 결과 승인
	@RequestMapping("battleResultOk.bt")
	public ModelAndView battleResultOk(int battleNo,
									   String victoryTeamNo,
									   String defeatTeamNo,
									   HttpSession session,
									   ModelAndView mv,
									   RedirectAttributes redirectAttributes) {
		
		if(battleService.battleResultOk(battleNo, victoryTeamNo, defeatTeamNo) > 0) {
			session.setAttribute("alertMsg", "배틀 결과 승인이 완료되었습니다.");
			redirectAttributes.addAttribute("battleNo", battleNo);
			mv.setViewName("redirect: battleDetail.bt");
		} else {
			mv.addObject("errorMsg", "배틀 결과 승인 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}

	
	// 배틀 신청 취소
	@RequestMapping("cancelBattle.bt")
	public String cancelBattle(String battleNo,
							   String memNo,
						 	   HttpSession session,
						 	   RedirectAttributes redirectAttributes
						 	   ) {
		
		HashMap<String, String> cancel = new HashMap<String, String>();
		cancel.put("battleNo", battleNo);
		cancel.put("memNo", memNo);
		cancel.put("chatContent", "배틀 신청을 취소하였습니다.");
		
		if(battleService.cancelBattle(cancel) > 0) {
			session.setAttribute("alertMsg", "배틀 신청이 취소되었습니다.");
			redirectAttributes.addAttribute("battleNo", battleNo);
		} else {
			session.setAttribute("alertMsg", "배틀 신청 취소를 실패하였습니다.");
		}
		return "redirect: battleDetail.bt";
	}
	// 배틀풀 삭제
	@RequestMapping("deleteBattlePool.bt")
	public String deleteBattlePool(int battleNo,
								   String changeName,
								   HttpSession session) {
		
		if(battleService.deleteBattlePool(battleNo) > 0 ) {
			// 서버에서 파일 삭제
			if(!changeName.equals("")) {
				new File(session.getServletContext().getRealPath(changeName)).delete();
			}
			session.setAttribute("alertMsg", "배틀풀 삭제를 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "배틀풀 삭제를 실패했습니다.");
		}
		return "redirect: battleList.bt";
	}
	// 배틀풀 수정폼
	@RequestMapping("resultUpdateForm.bt")
	public ModelAndView resultUpdateForm(int battleNo,
									     String homeTeam,
									     String awayTeam,
									     ModelAndView mv,
									     HttpSession session) {
		
		mv.addObject("battleNo", battleNo)
		  .addObject("homeTeam", battleService.selectTeam(homeTeam))
		  .addObject("awayTeam", battleService.selectTeam(awayTeam))
		  .addObject("battleResult", battleService.selectBattleResult(battleNo))
		  .setViewName("battle/battlePoolResultUpdateForm");
		return mv;
	}
	// 배틀풒 수정
	@RequestMapping("updateBattleResult.bt")
	public String updateBattleResult(BattleResult br, 
									 Model model,
									 RedirectAttributes redirectAttributes,
									 HttpSession session) {
		
		if(battleService.updateBattleResult(br) > 0) session.setAttribute("alertMsg", "배틀 결과 수정 성공");
		else session.setAttribute("alertMsg", "배틀 결과 수정 실패");
		
		redirectAttributes.addAttribute("battleNo", br.getBattleNo());
		return "redirect: battleDetail.bt";
	}
	
	
	
	
	
	
	/*
	 * topN
	 * 
	 * */
	// 다승팀
	@ResponseBody
	@RequestMapping(value="manyWin.top", produces="application/json; charset=UTF-8")
	public String selectListManyWin() {
		return new Gson().toJson(battleService.selectListManyWin());
	}
	
	
	
	
	
}