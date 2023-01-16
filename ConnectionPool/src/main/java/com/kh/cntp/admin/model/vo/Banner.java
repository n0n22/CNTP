package com.kh.cntp.admin.model.vo;

import lombok.Data;

@Data
public class Banner {

	private int bannerNo;		// 배너번호
	private int memNo;			// 작성자번호
	private String createDate;	// 등록일
	private String originName;	// 원본파일명
	private String changeName;	// 수정파일명
	private String status;		// 상태
	private String writer;		// 작성자닉네임
	
	
}
