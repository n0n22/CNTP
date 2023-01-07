package com.kh.cntp.notice.model.vo;

import lombok.Data;

@Data
public class Notice {

	private int noticeNo;		// 글번호
	private String category;	// 카테고리
	private String title;		// 제목
	private String content;		// 내용
	private String writer;		// 작성자닉네임
	private String createDate;	// 작성일
	private String originName;	// 원본파일명
	private String changeName;	// 수정파일명
	private String status;		// 상태
	private int memNo;			// 작성자번호
	
	
	
}
