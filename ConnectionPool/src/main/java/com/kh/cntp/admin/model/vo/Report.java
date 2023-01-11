package com.kh.cntp.admin.model.vo;

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
	
	private String memNickname;		// 신고대상자 닉네임
	private String reporterName;	// 신고자 닉네임
	
	
	private String content;			// 신고 글 내용

}
