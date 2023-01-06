package com.kh.cntp.diary.model.vo;

import lombok.Data;

@Data
public class Diary {
	private int diaryNo;
	private int writer;
	private String content;
	private String originName;
	private String changeName;
	private String scope;
	private String status;
}