package com.kh.cntp.moim.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chatting {
	
	private int chatNo;
	private String moimNo;
	private int memNo;
	private String chatContent;
	private String createDate;

}
