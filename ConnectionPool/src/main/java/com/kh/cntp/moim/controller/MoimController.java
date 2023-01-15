package com.kh.cntp.moim.controller;

import static com.kh.cntp.common.template.Template.saveFile;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.moim.model.service.MoimService;
import com.kh.cntp.moim.model.vo.Apply;
import com.kh.cntp.moim.model.vo.Chatting;
import com.kh.cntp.moim.model.vo.Group;
import com.kh.cntp.moim.model.vo.Team;
import com.kh.cntp.moim.model.vo.TeamMember;

@Controller
public class MoimController {
	
	@Autowired
	private MoimService moimService;
	@Autowired
	private MemberService memberService;
	
	// moimController 매핑값은 .mo로 통일!
	@RequestMapping("teamList.mo")
	public ModelAndView selectTeamList(ModelAndView mv,
								 @RequestParam(value="cpage", defaultValue="1") int currentPage,
								 @RequestParam(value="teamArea", defaultValue="all") String teamArea,
								 @RequestParam(value="keyword", defaultValue="all") String keyword,
								 @RequestParam(value="teamMember", defaultValue="all") String teamMember) {
		
		//System.out.println(teamMember);
		Team team = new Team();
		team.setTeamArea(teamArea);
		team.setKeyword(keyword);
		team.setTeamMember(teamMember);
		
		//System.out.println(team);
		//System.out.println(moimService.selectTeamCountList(team));
		
		PageInfo pi = Pagination.getPageInfo(moimService.selectTeamCountList(team), currentPage, 10, 10);
		
		mv.addObject("pi", pi).addObject("teamList", moimService.selectTeamList(pi, team)).addObject("team", team).setViewName("moim/teamListView");
		
		
		return mv;
	}
	
	@RequestMapping("teamPage.mo")
	public ModelAndView teamPage(ModelAndView mv, String teamNo) {
		// 팀 페이지 갈 때 TEAM, TEAM_MEMBER, APPLY 테이블 다 들고 가야됨 => 어째 이런 일이,,,,,,,,,
		// 한번의 select문으로 조인해서 가져올 수는 있는데, 3개의 vo에 담아야 하니 이를 어떻게 해야 할까
		
		/*
		System.out.println(moimService.selectTeam(teamNo));
		System.out.println(moimService.selectApplyList(teamNo));
		System.out.println(moimService.seletResultHistory(teamNo));
		*/
		
		mv.addObject("team", moimService.selectTeam(teamNo));
		mv.addObject("teamMemberList", moimService.selectTeamMemberList(teamNo));
		mv.addObject("applyList", moimService.selectApplyList(teamNo));
		mv.addObject("resultHistory", moimService.seletResultHistory(teamNo));
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
		
		//System.out.println(upfile.getOriginalFilename());
		
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
			
			session.setAttribute("alertMsg", "팀 생성이 완료되었습니다.");
			session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
			mv.setViewName("moim/teamListView");
		} else {
			mv.setViewName("main");
		}
		return mv;
	}
	
	@RequestMapping("teamUpdateForm.mo")
	public ModelAndView teamUpdateForm(ModelAndView mv, String teamNo) throws ParseException {
		
		Team team =  moimService.selectTeam(teamNo);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = format.parse((format.format(new Date())));	
		Date powerDuration = format.parse(team.getPowerDuration());
		
		
		
		if(today.compareTo(powerDuration) > 0) {
			//System.out.println("기간이 지남");
			team.setPowerDuration("false");
		} else {
			team.setPowerDuration(format.format(powerDuration));
		}
		
		mv.addObject("team", team);
		mv.setViewName("moim/teamUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("teamMemberUpdateForm.mo")
	public ModelAndView teamMemberUpdateForm(ModelAndView mv, String teamNo) {
		// teamNo 사용해서 teamMember 정보를 가지고서 updateForm으로 이동
		
		mv.addObject("teamMemberList", moimService.selectTeamMemberList(teamNo));
		
		mv.setViewName("moim/teamMemberUpdateForm");
		
		return mv;
	}
	
	// 채팅 관련 기능 시작
	
	@RequestMapping("chattingRoom.mo")
	public ModelAndView cahttingRoom(ModelAndView mv, Chatting chat, String moimMember, String moimTitle) {
		// teamNo 이용해서 채팅방 보내주기~
		
		//System.out.println(moimService.selectChattingList(chat));
		
		mv.addObject("chatList", moimService.selectChattingList(chat)).addObject("moimMember", moimMember).addObject("moimTitle", moimTitle).setViewName("moim/chatView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSelectChatList.mo", produces="application/json; charset=UTF-8")
	public String ajaxSelectChattingList(String moimNo, String memNo) {
		
		Chatting chat = new Chatting();
		
		chat.setMemNo(memNo);
		chat.setMoimNo(moimNo);
		
		return new Gson().toJson(moimService.selectChattingList(chat));
	}
	
	@ResponseBody
	@RequestMapping(value="insertChat.mo", produces="text/html; charset=UTF-8")
	public String ajaxInsertChatting(String moimNo, String memNo, String chatContent) {
		Chatting chat = new Chatting();
		
		chat.setMoimNo(moimNo);
		chat.setMemNo(memNo);
		chat.setChatContent(chatContent);
		
		String message = "";
		
		if(moimService.ajaxInsertChatting(chat) > 0) {
			message = "NNNNY";
		} else {
			message = "NNNNN";
		}
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteChat.mo", produces="text/html; charset=UTF-8")
	public String ajaxDeleteChatting(String chatNo) {

		//System.out.println(chatNo);
		
		if(moimService.ajaxDeleteChatting(chatNo) > 0) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
	@RequestMapping("badgeShop.mo")
	public ModelAndView badgeShop(ModelAndView mv) {
		
		mv.setViewName("moim/badgeBuyPage");
		
		return mv;
	}
	
	@RequestMapping("groupList.mo")
	public ModelAndView selectGroupList(ModelAndView mv,
										@RequestParam(value="cpage", defaultValue="1") int currentPage,
										@RequestParam(value="groupArea", defaultValue="all") String groupArea,
										@RequestParam(value="gender", defaultValue="A") String gender,
										@RequestParam(value="level", defaultValue="E") String level,
										@RequestParam(value="groupMember", defaultValue="A") String groupMember) {

		Group group = new Group();
		group.setGroupArea(groupArea);
		group.setGender(gender);
		group.setLevel(level);
		group.setGroupMember(groupMember);
		
		PageInfo pi = Pagination.getPageInfo(moimService.selectGroupCountList(group), currentPage, 10, 9);
		//System.out.println(pi);
		mv.addObject("pi", pi).addObject("groupList", moimService.selectGroupList(pi, group)).addObject("group", group).setViewName("moim/groupListView");
		
		return mv;
	}
	
	@RequestMapping("groupDetail.mo")
	public ModelAndView selectGroup(ModelAndView mv, String groupNo) {
		
		mv.addObject("group", moimService.selectGroup(groupNo)).addObject("applyList", moimService.selectApplyList(groupNo)).setViewName("moim/groupDetailView");
		
		return mv;
	}
	
	@RequestMapping("groupUpdateForm.mo")
	public ModelAndView groupUpdateForm(ModelAndView mv, String groupNo) {
		
		Group group = moimService.selectGroup(groupNo);
		
		group.setGroupMember(group.getGroupMember().substring(group.getGroupMember().indexOf('/') + 1, group.getGroupMember().indexOf(')')));
		group.setStartTime(group.getStartTime().replace(" ", "T").replace("/", "-").substring(0, 16));
		group.setEndTime(group.getEndTime().replace(" ", "T").replace("/", "-").substring(0, 16));
		//System.out.println(group);
		
		mv.addObject("group", group).setViewName("moim/groupUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("groupEnrollForm.mo")
	public ModelAndView groupEnrollFrom(ModelAndView mv) {
		
		mv.setViewName("moim/groupEnrollForm");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="selectApply.mo", produces="application/json; charset=UTF-8")
	public String ajaxSelectApply(HttpSession session) {
		//System.out.println(moimService.ajaxSelectApply(((Member)(session.getAttribute("loginMember"))).getMemNo()));
		return new Gson().toJson(moimService.ajaxSelectApply(((Member)(session.getAttribute("loginMember"))).getMemNo()));
	}
	
	@RequestMapping("updateTeam.mo")
	public ModelAndView updateTeam(ModelAndView mv, Team team, MultipartFile[] reUpfile, HttpSession session) {
		
		//System.out.println(team);
		// ------------- 팀 사진 처리 -------------
		if(!reUpfile[0].getOriginalFilename().equals("")) {
			// 새로운 팀 사진이 새로 들어왔을 때
			if(!team.getOriginName().equals("")) {
				// 1. 기존에 원래 팀 사진이 있는데 새 파일이 들어왔을 때
				// -> 기존 사진은 지워준다. 업데이트가 된 거니까
				new File(session.getServletContext().getRealPath(team.getChangeName())).delete();
			}
			// 1 + 2. 기존에 파일이 없었는데 새 파일이 들어왔을 경우
			team.setOriginName(reUpfile[0].getOriginalFilename());
			team.setChangeName("resources/upfiles/" + saveFile(reUpfile[0], session));
		}
		
		// 3. 기존 파일은 있는데 새 파일이 없을 때 + 4. 기존 파일도 없고 새 파일도 없을 때
		// => 둘다 그냥 그대로 보내주면 된다. input hidden으로 받아왔기 때문에 그대로 update
		
		// ------------- 뱃지 사진 처리 -------------
		if(team.getBadgeStatus().equals("Y")) {
			// 뱃지를 구매한 팀만 따지면 된다.
			if(!reUpfile[1].getOriginalFilename().equals("")) {
				// 새로운 뱃지 사진이 들어왔을 때
				if(!team.getBadgeOriginName().equals("")) {
					// 1. 기존에 원래 뱃지 사진 있는데 새 뱃지 파일이 들어왔을 때
					// => 기존 뱃지 사진 지워
					new File(session.getServletContext().getRealPath(team.getBadgeChangeName())).delete();
				}
				// 1. + 2. 기존에 파일 없는데 새 파일 들어왔을 경우
				team.setBadgeOriginName(reUpfile[1].getOriginalFilename());
				team.setBadgeChangeName("resources/upfiles/" + saveFile(reUpfile[1], session));
			}
		}
		
		// 3. 기존 파일은 있는데 새 파일이 없을 때 + 4. 기존 파일도 없고 새 파일도 없을 때
		// => 그냥 그대로 보내주면 된다. input hidden으로 받아왔기 때문에 그대로 update
		
		// ------------- 이제 업데이트 해주면 된다. -------------
		if(moimService.updateTeam(team)> 0) {
			// 성공
			session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
			session.setAttribute("alterMsg", "팀 정보 수정 완료");
			mv.setViewName("redirect:teamPage.mo?teamNo=" + team.getTeamNo());
		} else {
			// 실패
			mv.addObject("errorMsg", "팀 정보 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateBadge.mo")
	public ModelAndView updateTeamBadgeStatus(ModelAndView mv, Team team, HttpSession session) {
		if(moimService.updateTeamBadgeStatus(team) > 0) {
			session.setAttribute("alterMsg", "뱃지 구매 성공");
			mv.setViewName("redirect:teamPage.mo?teamNo=" + team.getTeamNo());
		} else {
			mv.addObject("errorMsg", "뱃지 구매 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("teamMemberUpdate.mo")
	public ModelAndView updateTeamMember(ModelAndView mv, String teamNo, int leader, String subLeader, HttpSession session) {

		// 팀멤버 정보 보낼 배열을 만든ㄴ다.
		ArrayList<TeamMember> teamMemberList = new ArrayList();
		
		// 먼저 팀장 정보를 담는다.
		TeamMember leaderInfo = new TeamMember();
		leaderInfo.setMemNo(leader);
		leaderInfo.setTeamGrade("L");
		leaderInfo.setTeamNo(teamNo);
		teamMemberList.add(leaderInfo);
		
		// 만약 부리더가 있다면 부리더의 정보도 담는다.
		if(subLeader != null) {
			TeamMember subLeaderInfo = new TeamMember();
			subLeaderInfo.setMemNo(Integer.parseInt(subLeader));
			subLeaderInfo.setTeamGrade("S");
			teamMemberList.add(subLeaderInfo);
		}
		
		
		if(moimService.updateTeamMember(teamMemberList) > 0) {
			// 모두 성공
			session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
			session.setAttribute("alterMsg", "팀원 정보 수정 성공");
			mv.setViewName("redirect:teamPage.mo?teamNo=" + teamNo);
		} else {
			// 실패
			mv.addObject("errorMsg", "팀원 정보 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("deleteTeamMember.mo")
	public ModelAndView deleteTeamMember(ModelAndView mv, int memNo, HttpSession session) {
		
		moimService.deleteTeamMember(memNo);
		
		session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
		
		return mv;
	}
	
	@RequestMapping("deleteApply.mo")
	public ModelAndView deleteApply(HttpSession session, ModelAndView mv, Apply ap) {
		
		if(moimService.DeleteApply(ap.getMemNo()) > 0) {
			// 성공
			session.setAttribute("alterMsg", "신청 취소 완료");
			mv.setViewName("redirect:teamPage.mo?teamNo=" + ap.getMoimNo());
		} else {
			mv.addObject("errorMsg", "신청 취소 실패").setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	@RequestMapping("insertApply.mo")
	public ModelAndView insertApply(ModelAndView mv, Apply ap) {
		
		if(moimService.insertApply(ap) > 0) {
			// 성공
			mv.setViewName("redirect:teamPage.mo?teamNo=" + ap.getMoimNo());
		} else {
			mv.addObject("errorMsg", "신청 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("updateApply.mo")
	public ModelAndView updateApply(ModelAndView mv, Apply ap) {
		
		//System.out.println(ap);
		
		if(moimService.UpdateApply(ap) > 0) {
			mv.setViewName("redirect:teamPage.mo?teamNo=" + ap.getMoimNo());
		}else {
			mv.addObject("errorMsg", "수락 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("insertGroup.mo")
	public ModelAndView insertGroup(ModelAndView mv, Group group, MultipartFile upfile, HttpSession session) {
		
		//System.out.println(group);
		
		group.setStartTime(group.getStartTime().replace("T", " "));
		group.setEndTime(group.getEndTime().replace("T", " "));
		
		if(!upfile.getOriginalFilename().equals("")) {
			group.setOriginName(upfile.getOriginalFilename());
			group.setChangeName("resources/upfiles/" + saveFile(upfile, session));
		}
		//System.out.println(group);
		
		if(moimService.insertGroup(group) > 0) {
			if(group.getPowerDuration() != null) {
				// point(-10)
			}
			session.setAttribute("alertMsg", "등록완료하였습니다.");
			mv.setViewName("redirect:groupList.mo");
		} else {
			session.setAttribute("errorMsg", "소그룹 등록 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateGroup.mo")
	public ModelAndView updateGroup(ModelAndView mv, Group group, MultipartFile reUpfile, HttpSession session) {
		
		group.setStartTime(group.getStartTime().replace("T", " "));
		group.setEndTime(group.getEndTime().replace("T", " "));
		
		//System.out.println(group);
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			if(!group.getOriginName().equals("")) {
				new File(session.getServletContext().getRealPath(group.getChangeName())).delete();
			}
			
			group.setOriginName(reUpfile.getOriginalFilename());
			group.setChangeName("resources/upfiles/" + saveFile(reUpfile, session));
		}
		
		if(moimService.updateGroup(group) > 0) {
			session.setAttribute("alertMsg", "소모임 정보 수정 완료");
			mv.setViewName("redirect:groupDetail.mo?groupNo=" + group.getGroupNo());
		} else {
			mv.addObject("errorMsg", "소모임 정보 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
}
