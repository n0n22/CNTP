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
import com.kh.cntp.battle.model.service.BattleServiceImpl;
import com.kh.cntp.battle.model.vo.Battle;
import com.kh.cntp.battle.model.vo.BattleResult;
import com.kh.cntp.battle.model.vo.PoolInfo;
import com.kh.cntp.battle.model.vo.ResultHistory;
import com.kh.cntp.common.template.Template;

import oracle.net.aso.a;

@Controller
public class BattlePoolController {
	@Autowired
	private BattleService battleService;
	
	/**
	 * selectBattlePoolList : 사용자에게 날짜를 입력받아 DB에 있는 배틀풀 목록을 조회해오는 메소드
	 * 
	 * @param cpage : 화면에서 넘어온 조회를 원하는 날짜
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 변환될 화면의 논리적인 경로
	 */
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
	/**
	 * searchBattle : 사용자에게 검색 조건을 입력받아 DB에 있는 배틀풀 목록을 조회해오는 메소드
	 * 
	 * @param cpage : 화면에서 넘어온 조회를 원하는 날짜
	 * @param area : 화면에서 넘어온 조회를 원하는 지역
	 * @param gender : 화면에서 넘어온 조회를 원하는 성별
	 * @param style : 화면에서 넘어온 조회를 원하는 종목
	 * @param level : 화면에서 넘어온 조회를 원하는 레벨
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 변환될 화면의 논리적인 경로
	 */
	@RequestMapping("search.bt")
	public ModelAndView searchBattle(String cpage,
								     @RequestParam(value = "area", defaultValue="") String area,
								     @RequestParam(value = "gender", defaultValue="") String gender,
								     @RequestParam(value = "style", defaultValue="") String style,
								     @RequestParam(value = "level", defaultValue="") String level,
								     ModelAndView mv) {
		// 동적 쿼리문을 위한 조건을 수행하기 위해 HashMap에 K, V 형태로 가공
		HashMap<String, String> condition = new HashMap<String, String>();
		condition.put("cpage", cpage);
		condition.put("area", area);
		condition.put("gender", gender);
		condition.put("style", style);
		condition.put("level", level);
		
		// 요청한 날짜 + 요청한 조건의 경기를 조회 후 ArrayList<Battle>에 담아 반환
		// HttpServletRequest의 attribute 영역에 담아주고 응답화면 지정
		// 페이지 이동시에도 검색한 키워드 데이터를 계속 남기기 위해 condition 역시 attribute 영역에 저장
		mv.addObject("battleList", battleService.searchBattle(condition))
		  .addObject("now", cpage)
		  .addObject("condition", condition)
		  .setViewName("battle/battlePoolList");
		
		return mv;
	}
	/**
	 * enrollForm : 배틀풀 작성폼으로 넘어가는 메소드
	 * @return
	 */
	@RequestMapping("enrollForm.bt")
	public String enrollForm() {
		return "battle/battlePoolEnrollForm";
	}
	/**
	 * insertBattle : 사용자가 입력한 배틀에 관한 정보들을 DB에 저장하는 메소드
	 * 
	 * @param battle : 화면에서 받아온 배틀에 관한 정보
	 * @param poolInfo : 화면에서 받아온 경기장에 관한 정보
	 * @param upfile : 파일이 저장되어 있는 경로 
	 * @param session : 파일의 물리적 경로를 알아내기 위한 세션 객체
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	
	/**
	 * selectBattlePool : 사용자에게 배틀 번호를 입력받아 배틀풀에 관한 상세 정보(경기, 경기장, 팀전적, 경기결과)를 DB에서 조회해오는 메소드
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀 번호
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	/**
	 * selectBattleResult : 사용자에게 배틀 번호, 홈팀 팀번호, 어웨이팀 팀번호를 입력받아 배틀 결과를 DB에서 조회해오는 메소드
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀 번호
	 * @param homeTeam : 화면에서 넘어온 홈팀 번호
	 * @param awayTeam : 화면에서 넘어온 어웨이팀 번호
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	
	/**
	 * resultEnrollForm : 사용자에게 배틀 번호, 홈팀 팀번호, 어웨이팀 팀번호를 입력받아 배틀 결과 작성폼을 보여주는 메소드 
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀 번호
	 * @param homeTeam : 화면에서 넘어온 홈팀 번호
	 * @param awayTeam : 화면에서 넘어온 어웨이팀 번호
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	
	/**
	 * applyBattle : 사용자에게 팀번호, 회원번호, 채팅내용, 배틀번호를 입력받아 DB에 배틀 신청을 입력해주는 메소드
	 * 
	 * @param teamNo : 화면에서 넘어온 팀 번호
	 * @param memNo : 화면에서 넘어온 회원 번호
	 * @param chatContent : 화면에서 넘어온 채팅 내용
	 * @param battleNo : 화면에서 넘어온 배틀 번호
	 * @param session : alertMsg를 담을 세션 객체 
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @param redirectAttributes : redirect시 데이터를 전달하기 위한 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
	@RequestMapping("battleApply.bt")
	public ModelAndView applyBattle(String teamNo,
								    String memNo,
								    String chatContent,
								    String battleNo,
								    HttpSession session,
								    ModelAndView mv,
								    RedirectAttributes redirectAttributes) {
		// 줄이자
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
	/**
	 * insertBattleResult : 사용자에게 배틀 결과를 입력받아 DB에 배틀 결과를 입력해주는 메소드
	 * 
	 * @param br : 화면에서 넘어온 배틀 결과 정보
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @param redirectAttributes : redirect시 데이터를 전달하기 위한 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
	@RequestMapping("insertBattleResult.bt")
	public ModelAndView insertBattleResult(BattleResult br, 
									 	   ModelAndView mv,
									 	   RedirectAttributes redirectAttributes) {
		
		if(battleService.insertBattleResult(br) > 0) {
			redirectAttributes.addAttribute("battleNo", br.getBattleNo());
			mv.setViewName("redirect: battleDetail.bt");
		} else {
			mv.addObject("errorMsg", "배틀 결과 작성 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	/**
	 * battleResultOk : 사용자에게 배틀 번호를 입력받아 DB에 배틀 결과를 승인해주는 메소드
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀 결과 정보
	 * @param victoryTeamNo : 화면에서 넘어온 승리팀 번호
	 * @param defeatTeamNo : 화면에서 넘어온 패배팀 번호
	 * @param session : alertMsg를 담아줄 세션 객체
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @param redirectAttributes : redirect시 데이터를 전달하기 위한 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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

	/**
	 * cancelBattle : 사용자가에게 값을 입력받아 DB에 있는 배틀 신청을 제거하는 메소드
	 * @param battleNo : 화면에서 넘어온 배틀번호
	 * @param memNo : 화면에서 넘어온 멤버번호
	 * @param session : alertMsg를 담아줄 세션 객체
	 * @param redirectAttributes 
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	/**
	 * deleteBattlePool: 사용자에게 값을 입력받아 작성한 배틀풀을 제거하는 메소드
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀 번호
	 * @param changeName : 화면에서 넘어온 서버에서 삭제할 파일 경로
	 * @param session : alertMsg를 담아줄 세션 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	
	/**
	 * resultUpdateForm : 사용자에게 값을 입력받아 배틀결과 수정폼을 보여주는 메소드
	 * 
	 * @param battleNo : 화면에서 넘어온 배틀번호
	 * @param homeTeam : 화면에서 넘어온 홈팀번호
	 * @param awayTeam : 화면에서 넘어온 어웨이팀 번호
	 * @param mv : 데이터와 반환할 화면의 논리적 경로를 담을 모델앤뷰 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
	@RequestMapping("resultUpdateForm.bt")
	public ModelAndView resultUpdateForm(int battleNo,
									     String homeTeam,
									     String awayTeam,
									     ModelAndView mv) {
		
		mv.addObject("battleNo", battleNo)
		  .addObject("homeTeam", battleService.selectTeam(homeTeam))
		  .addObject("awayTeam", battleService.selectTeam(awayTeam))
		  .addObject("battleResult", battleService.selectBattleResult(battleNo))
		  .setViewName("battle/battlePoolResultUpdateForm");
		return mv;
	}
	// 배틀풒 수정
	/**
	 * updateBattleResultupdateBattleResult : 사용자에게 값을 입력받아 DB의 배틀결과를 수정해주는 메소드
	 * 
	 * @param br : 화면에서 넘어온 배틀결과
	 * @param model : 데이터를 담기 위한 모델 객체
	 * @param redirectAttributes : redirect시 데이터를 전달하기 위한 객체
	 * @param session : alertMsg를 담기 위한 객체
	 * @return : 반환될 화면의 논리적인 경로
	 */
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
	
	
	@ResponseBody
	@RequestMapping("battleObjection.bt")
	public String battleObjection(String teamNo,
								  String memNo,
								  String chatContent,
								  String battleNo) {
		HashMap<String, String> objection = new HashMap<String, String>();
		objection.put("teamNo", teamNo);
		objection.put("memNo", memNo);
		objection.put("chatContent", chatContent);
		objection.put("battleNo", battleNo);
		
		return String.valueOf(battleService.battleObjection(objection));
	}
	
	/*
	 * topN
	 * 
	 * */
	/**
	 * 
	 * selectListBattleRank : 사용자에게 조건을 입력 받아 DB에서 조건별 팀 랭킹 목록을 조회할 ajax 메소드 
	 * 
	 * @param condition : 화면에서 넘어온 조건들
	 * @return : 비동기식으로 화면에 반환될 값
	 */
	@ResponseBody
	@RequestMapping(value="battleRank.top", produces="application/json; charset=UTF-8")
	public String selectListBattleRank(String condition) {
		return new Gson().toJson(battleService.selectListBattleRank(condition));
	}
	
}