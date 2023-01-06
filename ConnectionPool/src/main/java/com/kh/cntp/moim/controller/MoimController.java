package com.kh.cntp.moim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoimController {
	
	// moimController 매핑값은 .mo로 통일!
	@RequestMapping("teamEnrollForm.mo")
	public String teamEnrollFrom() {
		return "moim/groupDetailView";
		
		
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

}
