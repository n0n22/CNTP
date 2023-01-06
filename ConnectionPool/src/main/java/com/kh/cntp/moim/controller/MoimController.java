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
		
		
		/*
		팀페이지
		<jsp:foward page="teamPage.jsp"></jsp:foward>
		팀페이지(정보) 수정
		<!--<jsp:foward page="teamUpdateForm.jsp"/>-->
		팀가입(리스트
		<!--<jsp:foward page="teamListView.jsp"/>-->
		팀원수정
		<!--<jsp:foward page="teamMemberUpdate.jsp"/>-->
		뱃지 구매
		<!--<jsp:foward page="badgeBuyPage.jsp"/>-->
		
		<br><br>
	
		소모임 등록
		<!--<jsp:foward page="groupEnrollForm"/>-->
		소모임 수정
		<!--<jsp:foward page="groupUpdateForm"/>-->
		소모임 리스트
		<!--<jsp:foward page="groupListView"/>-->
		소모임 디테일
		<!--<jsp:foward page="groupDetailView"/>-->
		 */
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
	
	@RequestMapping("teamUpdateForm.mo")
	public ModelAndView updateTeamInfo(ModelAndView mv/*, int teamNo*/) {
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

}
