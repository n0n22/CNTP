package com.kh.cntp.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Member;

@Controller
public class MemberController {
	// ---화면지정용 나중에 전부 수정 및 로직 구성할 예정
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	@Autowired
	private JavaMailSender sender;
	
	
	// 비밀번호 초기화 및 메일인증을 위한 난수 생성 메소드
	public String generatorRandom() {
		Random r = new Random(); 
		int n = r.nextInt(100000); 
		Format f = new DecimalFormat("000000"); // 포맷형식
		String random = f.format(n); // 인트를 스트링으로
		
		return random;
	}
			
	// 암호문 만드는 메소드
	public String generatorEncPassword(String input) {
		String encPwd = bcryptPasswordEncoder.encode(input);
		
		return encPwd;
	}
	
	// 메일 보내는 메소드
	public void sendMail(String email, HttpServletRequest request) throws MessagingException {
		// ip주소 
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		// 메일보내기
		MimeMessage message = sender.createMimeMessage(); // sender == 전송도구 로 부터 MimeMessage객체 생성 
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		// 헬퍼에 정보설정하기 
		String url = ServletUriComponentsBuilder
				.fromCurrentContextPath()
				.port(8484)
				.path("/")
				.toUriString();
		
		String to = email; 
		helper.setTo(to); // 받는사람 설정
		helper.setSubject("ConnectionPool 본인확인 메일입니다"); // 메일제목
		helper.setText(
						"<h1>" + "인증번호를 입력해주세요" + "<h1>"
						+"<div style='color:blue;'>" + "<h2>" + generatorRandom() + "</h2>" + "</div>"
						+"<a style='text-decoration: none; font-size:13px' href="+url+">" +"ConnectionPool 바로가기"+ "</a>" 
						, true); 	
						

		//전송
		sender.send(message);
					
	}
	
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
			
			if(loginMember.getEndDate() != null) { // 정지일이 있을때
				Date today = new Date(); // 오늘 날짜 생성
				SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 비교를 위한 날짜 형식 지정
				Date endDate = DateFormat.parse(loginMember.getEndDate()); // 문자열을 DateFormat에 맞게 Date객체 리턴
				
				if(endDate.after(today)) { // 정지일이 오늘 날짜보다 이후라면
					SimpleDateFormat endViewFormat = new SimpleDateFormat("yyyy년MM월dd일"); // 년 월 일 로 표기 안할 시 2023-01-16 KST 00:00:00 로 뜸 
					session.setAttribute("loginMsg", "정지된 회원입니다. 기한: " + endViewFormat.format(endDate) + "까지");
					mv.setViewName("member/login");
				}
				
			} else { // 성공시 FAILCNT = 0 으로 업데이트
				memberService.loginCountReset(member); 
				session.setAttribute("loginMember", loginMember);
				mv.setViewName("redirect:/");
			}

		} else { // 실패 시 FAILCNT = +1로 업데이트			
			
			if(memberService.loginCount(member) > 0 ) {
				Member failMember = memberService.loginMember(member);
				if(failMember.getFailCnt() >= 5) { // 로그인시도횟수가 5보다 크거나 같다면 난수만들어서 비밀번호 초기화시키기
					String randPwd =generatorEncPassword(generatorRandom()); // 난수를 암호문으로 
					failMember.setMemPwd(randPwd);
					memberService.loginStopped(failMember);
					session.setAttribute("loginMsg", "5회이상 로그인에 실패하여 보안을 위해 잠김처리 되었습니다.\\n비밀번호 찾기를 통해 비밀번호를 재설정 해주세요.");
				} else {
					session.setAttribute("loginMsg", failMember.getFailCnt() + "회 로그인 실패  \\n5회 실패 시 로그인이 제한됩니다.");
				}
				mv.setViewName("member/login");
			} else {
				session.setAttribute("loginMsg", "알수없는 오류 발생 관리자에게 문의");
			}
			
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
	
	// ID찾기 페이지
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	// 아이디 찾기 
	@RequestMapping("findId.me")
	public ModelAndView findId(Member member, ModelAndView mv) {
		
		mv.addObject("findId" , memberService.findId(member));
		mv.setViewName("member/findIdResult");
		
		return mv;
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwd";
	}
			
	// 비밀번호 재설정 인증(아이디와 이메일 체크 후 메일 전송)
	@ResponseBody
	@RequestMapping("findPwdCert.me")
	public String findPwdCert(String checkId, String checkEmail, Member member, HttpServletRequest request) throws MessagingException {
		
		member.setMemId(checkId);
		member.setEmail(checkEmail);
		
		String result = "";
		
		if(memberService.findPwdMailRequest(member) > 0) { // 아이디와 이메일이 같다면
			result = "successEmail";
			sendMail(member.getEmail(),request); // 메일보내기
		} else {
			result = "failEmail";
		}
		return result;
	}
	
	// 메일 인증번호 확인
	@ResponseBody
	@RequestMapping("CertNum.me")
	public String CertNum() {
		
		return "gg";
	}
	
	
	// 비밀번호 재설정 
	@RequestMapping("findPwd")
	public String findPwd() {
		return "member/findPwdResult";
	}
	
	

	
}
