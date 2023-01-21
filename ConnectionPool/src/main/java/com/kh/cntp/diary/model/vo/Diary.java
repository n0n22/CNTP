package com.kh.cntp.diary.model.vo;

import lombok.Data;

@Data
public class Diary {
	private int diaryNo;
	private int memberNo;
	private String content;
	private String createDate; //작성일
	private String originName;
	private String changeName;
	private String scope;
	private String status;
	private int heart;

	
	
	
}
