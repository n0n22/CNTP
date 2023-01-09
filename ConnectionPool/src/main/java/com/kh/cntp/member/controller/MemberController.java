package com.kh.cntp.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Member;

@Controller
public class MemberController {
	// ---화면지정용 나중에 전부 수정 및 로직 구성할 예정
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
		
	// 로그인 페이지
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member member,
									HttpSession session,
									ModelAndView mv,
									String checkId,
									HttpServletResponse response) throws ParseException {
		
		Member loginMember = memberService.loginMember(member);
		// 쿠키발급
		if(checkId != null) {
			Cookie saveId = new Cookie("saveId", member.getMemId());
			saveId.setMaxAge(60 * 60 * 24 * 28 ); // 4주간 유지
			response.addCookie(saveId);
		}
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemPwd(), loginMember.getMemPwd())) {
			
			if(loginMember.getEndDate() != null) {
				Date today = new Date(); // 오늘 날짜 생성
				SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 비교를 위한 날짜 형식 지정
				Date endDate = DateFormat.parse(loginMember.getEndDate()); // 문자열을 DateFormat에 맞게 Date객체 리턴
				
				if(endDate.after(today)) { // 정지일이 오늘 날짜보다 이후라면
					SimpleDateFormat endViewFormat = new SimpleDateFormat("yyyy년MM월dd일"); // 년 월 일 로 표기 안할 시 2023-01-16 KST 00:00:00 로 뜸 
					
					session.setAttribute("loginMsg", "정지된 회원입니다. 기한: " + endViewFormat.format(endDate) + "까지");
					mv.setViewName("member/login");
				}
				
			} else {
				
				session.setAttribute("loginMember", loginMember);
				mv.setViewName("redirect:/");
				
			}

		} else {
			
			session.setAttribute("loginMsg","로그인 실패");
			mv.setViewName("member/login");
			
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	
	// ID찾기 페이지
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	// 아이디 찾기 
	@RequestMapping("findId.me")
	public String findId() {
		return "member/findIdResult";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwd";
	}
		
	// 비밀번호 재설정 인증(인증받고 재설정)
	@RequestMapping("findPwdCert.me")
	public String findPwdCert() {
		return "member/findPwdChange";
	}
	
	// 비밀번호 재설정 
	@RequestMapping("findPwd")
	public String findPwd() {
		return "member/findPwdResult";
	}
	
	
	// 회원가입 페이지
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 회원가입 
	@RequestMapping("memberInsert.me")
	public String insertMember() {
		return "member/memberEnrollResult";
	}
	
	
}
