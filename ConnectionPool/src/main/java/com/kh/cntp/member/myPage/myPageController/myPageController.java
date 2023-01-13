package com.kh.cntp.member.myPage.myPageController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Member;

@Controller
public class myPageController {
	// myPage 관련 컨트롤러 이 또한 화면지정을 위한 mapping값만 설정함 추후 수정예정
	
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
	public String myPageDelete() {
		return "member/myPage/myPageInfoDeleteResult";
	}
	
	// 마이페이지 포인트 내역 조회
	@RequestMapping("myPagePoint.me")
	public String myPagePoint() {
		return "member/myPage/myPagePoint";
	}
	
	// 마이페이지 작성글 조회
	@RequestMapping("myPageBoard.me")
	public String myPageBoard() {
		return "member/myPage/myPageBoard";
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
}
