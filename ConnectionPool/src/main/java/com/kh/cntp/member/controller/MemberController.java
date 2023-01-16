package com.kh.cntp.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import com.google.gson.Gson;
import com.kh.cntp.member.model.service.MemberService;
import com.kh.cntp.member.model.vo.Cert;
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
		
		// ip주소 가져오기 근데 왜 IPv6로 뜸??? 해결했음 
		// Run - Run Configurations.. - tomcat - Arguments -  VM arguments - -Djava.net.preferIPv4Stack=true 
		String ip = request.getRemoteAddr();
		String secret = generatorRandom();
		
		// builder 패턴 적용 .. setter랑 비슷함 setter + 기본생성자 느낌 
		Cert cert = Cert.builder().certIp(ip).secretNo(secret).build();
		memberService.sendMail(cert); // cert에 추가함
		
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
						+"<div style='color:blue;'>" + "<h2>" + secret + "</h2>" + "</div>"
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
		
		if (loginMember != null) { // NullPointException 방지
		
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
					String randPwd = generatorEncPassword(generatorRandom()); // 난수를 암호문으로 
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
		
		} else {
			session.setAttribute("loginMsg", "아이디와 비밀번호를 확인해주세요");
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
	
	// 회원가입 페이지
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 회원가입 
	@RequestMapping("memberInsert.me")
	public ModelAndView insertMember(Member member, String emailSite, String emailForm, ModelAndView mv) {
		
		if(emailSite == null) {	emailSite = emailForm; }
		member.setEmail(member.getEmail() + '@' + emailSite); // 사용자가 입력한 id + option값
		member.setBirthDay((member.getBirthDay().replace(",", "-"))); //jsp에서 name값 같게해서 넘김 ex) 99,09,19 >> replace해서 ,를 -로 변경
		member.setMemPwd((generatorEncPassword(member.getMemPwd()))); //사용자가 입력한 비밀번호 암호문으로 변경 후 VO에 담아줌
		
		if(memberService.insertMember(member) > 0) {
			mv.setViewName("member/memberEnrollResult");
		} else {
			mv.addObject("errorMsg","회원가입 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 회원가입 시 메일 인증
	@ResponseBody
	@RequestMapping("insertMailRequest.me")
	public String insertMailRequest(String checkId, String checkEmail, HttpServletRequest request) throws MessagingException {
		
		String email = checkId + '@' + checkEmail;
		String result = "";
		if (!email.equals("")) {
			result = "successEmail";
			sendMail(email, request);
		} else {
			result = "failEmail";
		}
		return result;
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
	@RequestMapping("findPwdMailRequest.me")
	public String findPwdMailRequest(String checkId, String checkEmail, Member member, HttpServletRequest request) throws MessagingException {
		
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
	@RequestMapping("certNum.me")
	public boolean certNumCheck(String certNum, HttpServletRequest request) {
		
		// cert builder
		Cert cert = Cert.builder()
		.certIp(request.getRemoteAddr())
		.secretNo(certNum).build();
		
		// DB에 맞는 정보가 있으면 true 없으면 false 반환 
		return memberService.certNumCheck(cert);
	}
	
	
	// 비밀번호 재설정 페이지
	@RequestMapping("pwdChangeForm.me")
	public ModelAndView pwdChangeForm(Member member, ModelAndView mv) {
		// 식별값 넘겨주기용
		mv.addObject(member);
		mv.setViewName("member/findPwdChange");
		
		return mv;
	}
	
	// 비밀번호 재설정
	@RequestMapping("pwdChange.me")
	public String pwdChange(Member member, HttpSession session) {
		// 사용자가 입력한 비밀번호 암호화 시키고 MemberVo에 다시 담기
		member.setMemPwd((generatorEncPassword(member.getMemPwd())));
		
		memberService.pwdChange(member);
		session.removeAttribute("loginMember");
		return "member/findPwdResult";
	}
	
	
	
	
	//////////////////////////////////
	// 인기도							//
	//////////////////////////////////
	// 회원 프로필 조회
	@ResponseBody
	@RequestMapping(value="showProfile.me", produces="application/json; charset=UTF-8")
	public String showProfile(int memNo) {
		Member m = memberService.showProfile(memNo);
		return new Gson().toJson(m);
	}
	// 인기도 올리는 기능
	// 1. 중복 체크 2. 인기도 인기도 올리거나 내리기 3. 인기도 기록 테이블에 INSERT 
	@ResponseBody
	@RequestMapping(value="ingido.me")
	public String ingido(String memNo, String flag, String targetNo) {
		// 인기도 식별 코드 만들기
		// F + "인기도 누른 회원" + T + "인기도 당한 회원" + U(up)/D(down)
		String ingido = "F" + memNo + "T" + targetNo;
		// 중복 검사
		int result = memberService.checkIngido(ingido);
		System.out.println(result);
		int result2 = 0;
		if(result == 0){
			System.out.println("결과" + result);
			ingido += flag.equals("1")? "U" : "D";
			// HashMap 객체에 담기
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("ingido", ingido);
			map.put("targetNo", targetNo);
			map.put("flag", flag);
			// 인기도 변경 및 기록
			result2 = memberService.upOrDownIngido(map);
	}
		return String.valueOf(result2);
	}
	
	

	
}
