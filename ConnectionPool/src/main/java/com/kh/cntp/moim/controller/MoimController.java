package com.kh.cntp.moim.controller;

import static com.kh.cntp.common.template.Template.saveFile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.service.MoimService;
import com.kh.cntp.moim.model.vo.Team;

@Controller
public class MoimController {
	
	@Autowired
	private MoimService moimService;
	
	// moimController 매핑값은 .mo로 통일!
	@RequestMapping("teamList.mo")
	public String selectTeamList() {
		return "moim/teamListView";
	}
	
	@RequestMapping("teamPage.mo")
	public ModelAndView teamPage(ModelAndView mv, String teamNo) {
		// 팀 페이지 갈 때 TEAM, TEAM_MEMBER, APPLY 테이블 다 들고 가야됨 => 어째 이런 일이,,,,,,,,,
		// 한번의 select문으로 조인해서 가져올 수는 있는데, 3개의 vo에 담아야 하니 이를 어떻게 해야 할까
		
		System.out.println(moimService.selectTeam(teamNo));
		System.out.println(moimService.selectTeamMemberList(teamNo));
		System.out.println(moimService.selectApplyList(teamNo));
		System.out.println(moimService.seletResultHistory(teamNo));
		
		/*
		mv.addObject("team", moimService.selectTeam(teamNo));
		mv.addObject("teamMeberList", moimService.selectTeamMemberList(teamNo));
		mv.addObject("applyList", moimService.selectApplyList(teamNo));
		mv.addObject("resultHistory", moimService.seletResultHistory(teamNo));
		*/
		
		mv.setViewName("moim/teamPage");
		
		return mv;
	}
	
	@RequestMapping("teamEnrollFrom.mo")
	public ModelAndView teamEnrollFrom(ModelAndView mv) {
		
		mv.setViewName("moim/teamEnrollForm");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="checkTeamName.mo")
	public String ajaxSelectTeam(String checkName) {
		
		if(moimService.ajaxSelectTeam(checkName) > 0) {
			// 중복되는 이름이 있을 경우
			return "NNNNN";
		}else {
			// 중복되는 이름이 없을 경우
			return "NNNNY";
		}
	}
	
	@RequestMapping("insertTeam.mo")
	public ModelAndView insertTeam(ModelAndView mv, Team team, MultipartFile upfile, HttpSession session) {
		
		if(team.getPowerDuration() != null) {
			// 파워 글이 아닐 경우
			// point(-50);
			// 이것이 성공했을 때
		} else {
			//point(-60);
			// 이것이 성공했을 때
		}
		
		System.out.println(upfile.getOriginalFilename());
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 파일 등록을 했을 때
			
			team.setOriginName(upfile.getOriginalFilename());
			team.setChangeName("resources/upfiles/" + saveFile(upfile, session));
		}
		
		if(moimService.insertTeam(team) > 0) {
			
			// 포인트를 사용해주자
			if(team.getPowerDuration() != null) {
				// point(-60);
			} else {
				// point(-50);
			}
			
			// 팀멤버 테이블에 팀장 insert
			// 경기기록도  insert
			
			mv.setViewName("moim/teamPage");
			mv.addObject("alertMsg", "팀 생성이 완료되었습니다.");
		} else {
			mv.setViewName("main");
		}
		
		return mv;
		
	}
	
	@RequestMapping("teamUpdateForm.mo")
	public ModelAndView teamUpdateForm(ModelAndView mv/*, int teamNo*/) {
		// teamNo 사용해서 team 정보를 가지고서 updateForm으로 이동
		
		mv.setViewName("moim/teamUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("teamMemberUpdateForm.mo")
	public ModelAndView teamMemberUpdateForm(ModelAndView mv/*, int teamNo*/) {
		// teamNo 사용해서 teamMember 정보를 가지고서 updateForm으로 이동
		
		mv.setViewName("moim/teamMemberUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("chattingRoom.mo")
	public ModelAndView cahttingRoom(ModelAndView mv/*, int teamNo*/) {
		// teamNo 이용해서 채팅방 보내주기~
		
		mv.setViewName("moim/chatView");
		
		return mv;
	}
	
	@RequestMapping("badgeShop.mo")
	public ModelAndView badgeShop(ModelAndView mv) {
		
		mv.setViewName("moim/badgeBuyPage");
		
		return mv;
	}
	
	@RequestMapping("groupList.mo")
	public String selectGroupList() {
		return "moim/groupListView";
		
	}
	
	@RequestMapping("groupDetail.mo")
	public ModelAndView selectGroup(ModelAndView mv/*, int groupNo*/) {
		
		mv.setViewName("moim/groupDetailView");
		
		return mv;
	}
	
	@RequestMapping("groupUpdateForm.mo")
	public ModelAndView groupUpdateForm(ModelAndView mv/*, int groupNo*/) {
		
		
		mv.setViewName("moim/groupUpdateForm");
		return mv;
	}
	
	@RequestMapping("groupEnrollForm.mo")
	public ModelAndView groupEnrollFrom(ModelAndView mv) {
		
		mv.setViewName("moim/groupEnrollForm");
		
		return mv;
	}
	
	
	
	
	
}
