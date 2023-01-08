package com.kh.cntp.member.myPage.myPageController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPageController {
	// myPage 관련 컨트롤러 이 또한 화면지정을 위한 mapping값만 설정함 추후 수정예정
	
	// 마이페이지 (기본값 회원정보)
	@RequestMapping("myPageInfo.me")
	public String myPage() {
		return "member/myPage/myPageInfo";
	}
	
	// 마이페이지 회원정보 수정
	@RequestMapping("myPageUpdate.me")
	public String myPageInfoUpdate() {
		return "redirect:mypage.me";
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
}
