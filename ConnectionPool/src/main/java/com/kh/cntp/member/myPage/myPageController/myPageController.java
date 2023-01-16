package com.kh.cntp.member.myPage.myPageController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Member;
import com.kh.cntp.member.model.vo.Point;

@Controller
public class myPageController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	// 암호문 만드는 메소드
	public String generatorEncPassword(String input) {
		String encPwd = bcryptPasswordEncoder.encode(input);
		
		return encPwd;
	}
	
	// 마이페이지 (기본값 회원정보)
	@RequestMapping("myPageInfo.me")
	public String myPage() {
		return "member/myPage/myPageInfo";
	}
	
	// 마이페이지 회원정보 수정
	@RequestMapping("myPageUpdate.me")
	public ModelAndView myPageInfoUpdate(Member member, String emailSite, String emailForm, ModelAndView mv, HttpSession session) {
		
		if(emailSite == null) {	emailSite = emailForm; }
		member.setEmail(member.getEmail() + '@' + emailSite); // 사용자가 입력한 id + option값
		String sessionPwd = ((Member)session.getAttribute("loginMember")).getMemPwd();
		
		// 사용자가 입력한 비밀번호가 session에 있는 loginMember.memPwd랑 같아야함 !! 
		if (bcryptPasswordEncoder.matches(member.getMemPwd(),sessionPwd)) {
			if(memberService.myPageInfoUpdate(member) > 0) {
				// DB로부터 수정된 회원정보를 다시 조회해서
				// session에 loginMember라는 키값으로 덮어씌워줘야함
				session.setAttribute("loginMember", memberService.loginMember(member));
				session.setAttribute("alertMsg","정보 수정 완료");
			} else {
				session.setAttribute("alertMsg","정보 수정 완료");
			}
		} else {
			session.setAttribute("alertMsg", "비밀번호가 맞지 않습니다");
		}
		
		mv.setViewName("redirect:myPageInfo.me");
		
		return mv;
	}
	
	// 마이페이지 회원탈퇴 페이지
	@RequestMapping("myPageDeleteForm.me")
	public String myPageDeleteForm() {
		return "member/myPage/myPageInfoDelete";
	}
	
	// 마이페이지 회원탈퇴 결과페이지
	@RequestMapping("myPageDelete.me")
	public ModelAndView myPageDelete(String agree, ModelAndView mv, HttpSession session) {
		 
//		if (((Member)session.getAttribute("loginMember")).getTeamGrade().equals("L")) {
//			mv.addObject("alertMsg", "팀장 권한 위임 후 탈퇴 가능합니다");
//			mv.setViewName("");
//		} 
		
		if (agree.equals("동의합니다")) {
			if(memberService.myPageDelete(((Member)session.getAttribute("loginMember"))) > 0) {
				session.removeAttribute("loginMember");
				session.setAttribute("alertMsg", "회원 탈퇴 성공");
				mv.setViewName("member/myPage/myPageInfoDeleteResult");
			} else {
				mv.setViewName("common/errorPage");
				mv.addObject("errorMsg", "회원가입 실패");
			}
		} else {
			session.setAttribute("alertMsg", "동의합니다를 입력해주세요.");
			mv.setViewName("redirect:myPageDeleteForm.me");
		}
		return mv;
	}
	
	// 마이페이지 포인트 내역 조회
	@RequestMapping("myPagePoint.me")
	public ModelAndView myPagePoint(HttpSession session,
									ModelAndView mv,
									Point point,
									@RequestParam(value="cpage", defaultValue="1")int cPage,
									@RequestParam(value="category", defaultValue="all")String category) {
		
		// Point에 현재 로그인한 회원번호,카테고리 set 
		point.setMemNo(((Member)session.getAttribute("loginMember")).getMemNo());
		point.setCategory(category); 
		
		PageInfo pi = Pagination.getPageInfo(memberService.selectPointCount(point), cPage, 5, 5);
		
		mv.addObject("pi", pi);
		mv.addObject("plist", memberService.selectPointList(pi, point));
		mv.addObject("category", category);
		mv.setViewName("member/myPage/myPagePoint");
		
		return mv;
	}
	
	// 마이페이지 작성글 조회
	@RequestMapping("myPageBoard.me")
	public ModelAndView myPageBoard(HttpSession session,
									ModelAndView mv,
									Board board,
									@RequestParam(value="cpage", defaultValue="1")int cpage,
									@RequestParam(value="category", defaultValue="all")String category) {
		
		// Board에 현재 로그인한 회원번호(식별값), 카테고리 set
		board.setMemberNo(((Member)session.getAttribute("loginMember")).getMemNo());
		board.setCategory(category);
		
		PageInfo pi = Pagination.getPageInfo(memberService.selectMyBoardCount(board), cpage, 5, 5);
		
		mv.addObject("pi", pi);
		mv.addObject("blist", memberService.selectMyBoardList(pi, board));
		mv.addObject("category", category);
		mv.setViewName("member/myPage/myPageBoard");
		
		return mv;
	}
	
	// 마이페이지 소모임 조회
	@RequestMapping("myPageMoim.me")
	public String myPageMoim() {
		return "member/myPage/myPageMoim";
	}
	
	// 마이페이지 수영일기 조회
	@RequestMapping("myPageDiary.me")
	public String myPageDiary() {
		return "member/myPage/myPageDiary";
	}
	
	// 마이페이지 팀 조회
	@RequestMapping("myPageTeam.me")
	public String myPageTeam() {
		return "member/myPage/myPageTeam";
	}
	
	// 출석체크 페이지
	@RequestMapping(value="myPageAtCheckForm.me", produces="application/json; charset=UTF-8")
	public ModelAndView myPageAtCheckForm(HttpSession session, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		mv.addObject("checkList",new Gson().toJson(memberService.selectAtCheck(memNo)));
		mv.setViewName("member/myPage/myPageAttendanceCheck");
		
		return mv;
	}
	
	// 출석체크
	@RequestMapping("myPageAtCheck.me")
	public String myPageAtCheck(int memNo, String pt, Point point, HttpSession session) {
		point.setMemNo(memNo);
		point.setPoint(pt);
		
		if(memberService.countAtCheck(memNo) == 0) {
			if(memberService.insertAtCheck(point) > 0){
				session.setAttribute("alertMsg","출석체크 완료");
				
			} else {
				session.setAttribute("alertMsg","관리자에게 문의하세요");
			}
			
		} else {
			session.setAttribute("alertMsg", "이미 출석하셨습니다");
		}
		
		
		
		return "redirect:myPageAtCheckForm.me";
	}
}
