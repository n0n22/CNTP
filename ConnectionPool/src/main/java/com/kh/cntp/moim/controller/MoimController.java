package com.kh.cntp.moim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MoimController {
	
	// moimController 매핑값은 .mo로 통일!
	@RequestMapping("teamList.mo")
	public String selectTeamList() {
		return "moim/teamListView";
	}
	
	@RequestMapping("teamPage.mo")
	public ModelAndView teamPage(ModelAndView mv, int teamNo) {
		// 팀 페이지 갈 때 TEAM, TEAM_MEMBER, APPLY 테이블 다 들고 가야됨 => 어째 이런 일이,,,,,,,,,
		// 한번의 select문으로 조인해서 가져올 수는 있는데, 3개의 vo에 담아야 하니 이를 어떻게 해야 할까
		
		mv.setViewName("moim/teamPage");
		
		return mv;
	}
	
	@RequestMapping("teamEnrollFrom.mo")
	public ModelAndView teamEnrollFrom(ModelAndView mv) {
		
		mv.setViewName("moim/teamEnrollForm");
		
		return mv;
	}
	
	@RequestMapping("insertTeam.mo")
	public ModelAndView insertTeam(ModelAndView mv) {
		
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
