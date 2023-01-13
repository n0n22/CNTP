package com.kh.cntp.admin.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class Report {
	
	private int reportNo;			// 신고번호
	private int memNo;				// 신고대상자 회원번호
	private String reportBoard;		// 신고대상글유형
	private String reportDate;		// 신고일
	private int boardNo;			// 신고대상글번호
	private String reportReason;	// 신고사유
	private int reporter;			// 신고자 회원번호
	private String completionDate;	// 처리일
	private String reportResult;	// 처리결과
	
	private String memId;		// 신고대상자 아이디
	private String memNickName;		// 신고대상자 아이디
	private String reporterId;	// 신고자 아이디
	
	private String content;			// 신고 글 내용
	

	//패널티용
	private String penalty;			// 부과할 패널티 내역
	private int count;				// 신고 누적수
	
	
}
