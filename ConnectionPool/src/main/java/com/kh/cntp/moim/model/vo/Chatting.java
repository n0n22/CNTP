package com.kh.cntp.moim.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chatting {
	
	private int chatNo;
	private int moimNo;
	private int memNo;
	private String chatContent;
	private Date createDate;

}
