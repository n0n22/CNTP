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
	
	
	/**
	 * selectTeamList : 사용자에게 조건값을 받아서 DB에 있는 Team ResultSet을 select해오는 메소드
	 * @param currentPage : 요청하는 페이지
	 * @param teamArea : 팀 주요 활동지역 조건
	 * @param keyword : 배틀, 친목, 온라인만 키워드 조건
	 * @param teamMember : 팀 인원 조건
	 */
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
	
	//인터셉터 필요
	/**
	 * teamEnrollForm : 팀 등록 폼으로 이동
	 */
	@RequestMapping("teamEnrollForm.mo")
	public ModelAndView teamEnrollForm(ModelAndView mv) {
		
		mv.setViewName("moim/teamEnrollForm");
		
		return mv;
	}
	
	/**
	 * ajaxSelectTeam : 사용자에게 팀 이름을 입력 받아 DB에 있는 TeamName과 중복값이 있는지 select해오는 메소드
	 * @param checkName : 사용하고자 하는 팀 이름(중복체크)
	 */
	@ResponseBody
	@RequestMapping(value="checkTeamName.mo", produces="text/html; charset=UTF-8")
	public String ajaxSelectTeam(String checkName) {
		
		if(moimService.ajaxSelectTeam(checkName) > 0) {
			// 중복되는 이름이 있을 경우
			return "NNNNN";
		}else {
			// 중복되는 이름이 없을 경우
			return "NNNNY";
		}
	}
	
	//인터셉터 필요
	// 팀 등록 + 전적 등록 + 리더 팀멤버 등록 + 로그인 유저 다시 담아줌
	/**
	 * insertTeam : 사용자에게 정보를 입력받아서 DB에 TEAM 테이블에 추가하는 메소드
	 * @param team : teamName, memNo, teamMember(팀인원), teamIntro, teamArea, teamTime, keyword, powerDuration
	 * @param upfile : 팀소개사진 첨부파일(originName, changeName)
	 */
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
			mv.setViewName("redircet:teamList.mo");
		} else {
			mv.setViewName("main");
		}
		return mv;
	}
	
	/**
	 * teamPage : 사용자가 입력한 팀 번호를 식별값으로 팀, 팀멤버, 신청 내역 select
	 * @param mv
	 * @param teamNo : 팀, 팀멤버, 신청 내역의 식별값
	 * @return
	 */
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
	
	/**
	 * ajaxSelectApply : teamPage와 groupDetailView에
	 * 다른 사용자가 들어갈 때 해당 모임에 신청했는지 DB에 있는 apply테이블에서 select해 확인하는 메소드
	 * @param ap : loginMember의 memNo, 해당 모임의 moimNo로 apply 조회
	 * @return
	 */
	//인터셉터 필요
	@ResponseBody
	@RequestMapping(value="selectApply.mo", produces="application/json; charset=UTF-8")
	public String ajaxSelectApply(Apply ap) {
		
		//System.out.println(ap);
		return new Gson().toJson(moimService.ajaxSelectApply(ap));
	}
	
	//인터셉터 필요
	/**
	 * teamUpdateForm : 사용자가 요청한 teamNo를 식별값으로 팀 정보 수정 페이지로 이동
	 * @param teamNo : 해당 팀의 정보를 가지고 오기 위한 식별값
	 * @param teamMemberCount : 현재 팀원 수를 알 수 있도록 teamMemberList의 사이즈를 담아옴.
	 */
	@RequestMapping("teamUpdateForm.mo")
	public ModelAndView teamUpdateForm(ModelAndView mv, String teamNo, int teamMemberCount) throws ParseException {
		
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
		
		mv.addObject("team", team).addObject("teamMemberCount", teamMemberCount);
		mv.setViewName("moim/teamUpdateForm");
		
		return mv;
	}
	
	// 뱃지를 바꿨을 수도 있으니 로그인유저 다시
	//인터셉터 필요
	/**
	 * updateTeam : 사용자가 입력한 값으로 DB에 Team 테이블 정보 업데이트 메소드
	 * @param team : teamNo, teamMember(팀 인원), teamIntro, teamArea, teamTime, keyword, powerDuration, originName, changeName, badgeOriginName, badgeChangeName, badgeStatus
	 * @param reUpfile : 1) reUpfile[0] : 팀 대표 사진(originName, changeName) 2) reUpfile[1] : 뱃지 사진(badgeOriginName, badgeChangeName)
	 */
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
				
				session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
				
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
	
	//인터셉터 필요
	/**
	 * teamMemberUpdateForm : 사용자가 요청한 teamNo로 teamMemberList를 DB에서 select해 팀 멤버 업데이트 폼으로 이동(팀 멤버 정보를 가지고 이동)
	 * @param teamNo : 해당 팀의 식별값
	 */
	@RequestMapping("teamMemberUpdateForm.mo")
	public ModelAndView teamMemberUpdateForm(ModelAndView mv, String teamNo) {
		// teamNo 사용해서 teamMember 정보를 가지고서 updateForm으로 이동
		
		mv.addObject("teamMemberList", moimService.selectTeamMemberList(teamNo));
		
		mv.setViewName("moim/teamMemberUpdateForm");
		
		return mv;
	}
	
	// 세션에 로그인멤버 다시 담기
	//인터셉터 필요
	/**
	 * updateTeamMember : 1) teamNo를 식별값으로 팀의 모든 팀멤버의 등급을 M으로 바꾼다. 그 후 leader와 subLeader에 담긴 memNo를 식별값으로 leader등급과 subLeader 등급을 update한다.
	 * @param teamNo : update하고자 하는 팀의 식별값
	 * @param leader : 리더로 등급 변경하고자 하는 팀 멤버의 memNo를 담아온다.
	 * @param subLeader : 부리더로 등급 변경하고자 하는 팀 멤버의 memNo를 담아온다.
	 */
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
			// 현재 팀장의 grade가 변경됐을 수도 있기 때문에 loginMember에 새 정보를 담아준다.
			session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
			session.setAttribute("alterMsg", "팀원 정보 수정 성공");
			mv.setViewName("redirect:teamPage.mo?teamNo=" + teamNo);
		} else {
			// 실패
			mv.addObject("errorMsg", "팀원 정보 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * badgeShop : 팀 뱃지 구매 페이지로 이동
	 */
	//인터셉터 필요
	@RequestMapping("badgeShop.mo")
	public ModelAndView badgeShop(ModelAndView mv) {
		
		mv.setViewName("moim/badgeBuyPage");
		
		return mv;
	}
	
	/**
	 * updateTeamBadgeStatus : teamNo를 식별값으로 받아 해당 팀의 badgeStatus를 Y로 변경해주는 메소드
	 * @team : 1) teamNo : 팀 식별값, 2) memNo : 포인트를 소비하기 위한 멤버 식별값
	 */
	//인터셉터 필요
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
	
	//인터셉터 필요
	/**
	 * deleteTeamMember : DB에서 teamNo와 memNo를 조건으로 teamMember를 삭제하는 메소드
	 * @param tm : 1) teamNo : 해당 팀의 식별값, 2) memNo : 탈퇴하고자 하는 멤버의 식별값
	 */
	@RequestMapping("deleteTeamMember.mo")
	public ModelAndView deleteTeamMember(ModelAndView mv, TeamMember tm, HttpSession session) {
		
		if(moimService.deleteTeamMember(tm) > 0) {
			session.setAttribute("loginMember", memberService.loginMember((Member)session.getAttribute("loginMember")));
			mv.setViewName("redirect:teamList.mo");
		} else {
			mv.addObject("errorMsg", "탈퇴 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//인터셉터 필요
	/**
	 * insertApply : 팀, 소모임 참여 심청 메소드
	 * @param ap : memNo : 요청을 보내는 회원의 회원 정보 식별값, moimNo : 신청하고자 하는 모임번호 / 보내줄 페이지 식별값
	 */
	@RequestMapping("insertApply.mo")
	public ModelAndView insertApply(ModelAndView mv, Apply ap) {
		
		if(moimService.insertApply(ap) > 0) {
			// 성공
			if(ap.getMoimNo().contains("T")) {
				mv.setViewName("redirect:teamPage.mo?teamNo=" + ap.getMoimNo());
			} else {
				mv.setViewName("redirect:groupDetail.mo?groupNo=" + ap.getMoimNo());
			}
		} else {
			mv.addObject("errorMsg", "신청 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//인터셉터 필요
	/**
	 * insertTeamMember : 팀장이 팀 신청 수락 시 TeamMember 테이블에 해당 회원의 정보 insert 메소드
	 * @param tm : 1) memNo : 신청한 회원의 memNo, 2) teamNo : 신청한 팀의 teamNo
	 * @param applyNo : 해당 요청 정보를 삭제하기 위한 식별값
	 * @return
	 */
	@RequestMapping("insertTeamMember.mo")
	public ModelAndView insertTeamMember(ModelAndView mv, TeamMember tm, int applyNo) {
		
		Apply ap = new Apply();
		ap.setApplyNo(applyNo);
		ap.setMemNo(tm.getMemNo());
		ap.setMoimNo(tm.getTeamNo());
		
		if(moimService.insertTeamMember(tm, ap) > 0) {
			mv.setViewName("redirect:teamPage.mo?teamNo=" + tm.getTeamNo());
		} else {
			mv.addObject("errorMsg", "신청 수락 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//인터셉터 필요
	/**
	 * deleteApply : 팀, 소모임 신청 거절 및 팀 수락 후 사용하는 apply 정보 삭제 메소드(MoimServiceImpl 클래스에서 insertTeamMember 메소드 내에서 사용)
	 * @param ap : memNo : 신청한 회원 정보 식별값, moimNo : 신청한 모임 정보 식별값 / 돌려보내줄 화면 지정 시 필요
	 */
	@RequestMapping("deleteApply.mo")
	public ModelAndView deleteApply(HttpSession session, ModelAndView mv, Apply ap) {
		// moimNo랑 memNo가 담겨 있음
		if(moimService.deleteApply(ap) > 0) {
			session.setAttribute("alterMsg", "신청 취소 완료");
			if(ap.getMoimNo().contains("T")) {
				mv.setViewName("redirect:teamPage.mo?teamNo=" + ap.getMoimNo());
			} else {
				mv.setViewName("redirect:groupDetail.mo?groupNo=" + ap.getMoimNo());
			}
		} else {
			mv.addObject("errorMsg", "신청 취소 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// ------------------- 채팅 관련 기능 시작 -------------------
	
	//인터셉터 필요
	/**
	 * cahttingRoom : 팀, 소모임 대화 내용을 담고 채팅방으로 보내주는 메소드
	 * @param chat : moimNo : 해당 모임 식별값, memNo : 채팅방에 입장하는 회원의 정보 식별값
	 * @param moimMember : 모임에 현재 참여신청 완료되어 채팅방에 들어올 수 있는 사람의 수
	 * @param moimTitle : 팀이름 또는 소그룹 모집 제목
	 */
	@RequestMapping("chattingRoom.mo")
	public ModelAndView cahttingRoom(ModelAndView mv, Chatting chat, String moimMember, String moimTitle) {
		// teamNo 이용해서 채팅방 보내주기~
		
		if(chat.getMoimNo().contains("G")) {
			ArrayList<Member> groupMemberList = moimService.selectAcceptMember(chat.getMoimNo());
			mv.addObject("chatMemberList", groupMemberList);
			
			moimMember = String.valueOf(groupMemberList.size());
			
		} else if(chat.getMoimNo().contains("T")) {
			mv.addObject("chatMemberList", moimService.selectTeamMemberList(chat.getMoimNo()));
		}
		
		mv.addObject("chatList", moimService.selectChattingList(chat)).addObject("moimMember", moimMember).addObject("moimNo", chat.getMoimNo()).addObject("moimTitle", moimTitle).setViewName("moim/chatView");
		
		return mv;
	}
	
	/**
	 * 1초에 한번씩 비동기식으로 대화내용 계속 가져와주는 메소드
	 * @param chat : moimNo : 해당 모임 식별값, memNo : 채팅방에 참여한 loginMember의 회원 식별값
	 */
	//인터셉터 필요
	@ResponseBody
	@RequestMapping(value="ajaxSelectChatList.mo", produces="application/json; charset=UTF-8")
	public String ajaxSelectChattingList(Chatting chat) {
		
		return new Gson().toJson(moimService.selectChattingList(chat));
	}
	
	/**
	 * 채팅 내용 추가하는 메소드
	 */
	//인터셉터 필요
	@ResponseBody
	@RequestMapping(value="insertChat.mo", produces="text/html; charset=UTF-8")
	public String ajaxInsertChatting(String moimNo, String memNo, String chatContent) {
		Chatting chat = new Chatting();
		
		chat.setMoimNo(moimNo);
		chat.setMemNo(memNo);
		chat.setChatContent(chatContent);
		
		//System.out.println(chat);
		
		String message = "";
		
		if(moimService.ajaxInsertChatting(chat) > 0) {
			message = "NNNNY";
		} else {
			message = "NNNNN";
		}
		return message;
	}
	
	/**
	 * 채팅 삭제하는 메소드
	 */
	//인터셉터 필요
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
	
	/**
	 * 아래 조건에 맞추어 소그룹 리스트를 조회
	 * @param currentPage
	 * @param groupArea
	 * @param gender
	 * @param level
	 * @param groupMember
	 */
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
	
	/**
	 * 소그룹 등록 폼으로 이동
	 */
	//인터셉터 필요
	@RequestMapping("groupEnrollForm.mo")
	public ModelAndView groupEnrollFrom(ModelAndView mv) {
		
		mv.setViewName("moim/groupEnrollForm");
		
		return mv;
	}
	
	/**
	 * 소그룹 등록
	 */
	//인터셉터 필요
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
		
	/**
	 * 소그룹 정보, 소그룹 개최자 멤버 정보, 신청 정보를 가지고 디테일 뷰로 이동
	 */
	@RequestMapping("groupDetail.mo")
	public ModelAndView selectGroup(ModelAndView mv, String groupNo) {
		
		Group group = moimService.selectGroup(groupNo);
		
		long startTimeNum = Long.parseLong(group.getStartTime().replace("/", "").replace(" ", "").replace(":", ""));
		long todayNum = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		
		String deadLine = "";
		
		if(startTimeNum <= todayNum) {
			deadLine = "expired";
		} else {
			deadLine = "ok";
		}
		
		String engLevel = "";
		String engGender = "";
		
		switch(group.getLevel()){
			case "초급" : engLevel = "B";
			break;
			case "중급" : engLevel = "M";
			break;
			case "고급" : engLevel = "S";
		}
		
		switch(group.getGender()) {
			case "여자만" : engGender = "F";
			break;
			case "남자만" : engGender = "M";
		}
		
		mv.addObject("engGender", engGender).addObject("engLevel", engLevel).addObject("group", group).addObject("deadLine", deadLine).addObject("applyList", moimService.selectGroupApplyList(groupNo)).setViewName("moim/groupDetailView");
		
		return mv;
	}
	
	/**
	 * 소모임 정보를 가지고 수정폼으로 이동
	 */
	//인터셉터 필요
	@RequestMapping("groupUpdateForm.mo")
	public ModelAndView groupUpdateForm(ModelAndView mv, String groupNo) {
		
		Group group = moimService.selectGroup(groupNo);
		
		String groupMember = group.getGroupMember();
		String partiNum = "";
		
		//System.out.println(groupMember);
		
		if(!group.getGroupMember().contains("모집마감")) {
			//모집 마감이 아니라면 => (a/b)
			// a값을 담아줌
			group.setGroupMember(groupMember.substring(groupMember.indexOf('/') + 1, groupMember.indexOf(')')));
			// b값을 담아줌
			partiNum = groupMember.substring(1, groupMember.indexOf('/'));
		} else {
			// 모집마감이라면 => 모짐마감(a)
			// 둘 다 a값을 담아줌. 모집인원의 현재값과 최소값을 가져가기 위함
			group.setGroupMember(groupMember.substring(groupMember.indexOf('(') + 1, groupMember.indexOf(')')));
			partiNum = group.getGroupMember();
		}
		//2023/01/01 12:00:00 형태를 -> 2023-01-01T12:00 형태로 변경하여 input Date의 min 값으로 활용
		group.setEndTime(group.getEndTime().replace(" ", "T").replace("/", "-").substring(0, 16));
		group.setStartTime(group.getStartTime().replace(" ", "T").replace("/", "-").substring(0, 16));
		
//		System.out.println(group.getEndTime());
//		System.out.println(group.getStartTime());
//		System.out.println(group.getGroupMember());
//		System.out.println(partiNum);
		
		mv.addObject("group", group).addObject("partiNum", partiNum).setViewName("moim/groupUpdateForm");
		
		return mv;
	}
	
	/**
	 * 소그룹 정보 업데이트
	 */
	//인터셉터 필요
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
	
	
	
	/**
	 * 소그룹 신청 수락 시 ACCETP_YN을 Y로 바꿔주고 ACCEPT_DATE를 현재로 업데이트 해주는 메소드
	 */
	//인터셉터 필요
	@RequestMapping("updateApply.mo")
	public ModelAndView updateGroupApply(ModelAndView mv, Apply ap) {
		
		if(moimService.updateApply(ap) > 0) {
			mv.setViewName("redirect:groupDetail.mo?groupNo=" + ap.getMoimNo());
		} else {
			mv.addObject("errorMsg", "수락 실패").setViewName("common/errorMsg");
		}
		
		return mv;
	}
	
	/**
	 * 소그룹 삭제 메소드
	 */
	//인터셉터 필요
	@RequestMapping("deleteGroup.mo")
	public ModelAndView deleteGroup(ModelAndView mv, Group group) {
		
		if(moimService.deleteGroup(group) > 0) {
			mv.setViewName("redirect:groupList.mo");
		} else {
			mv.addObject("errorMsg", "삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
}
