package com.kh.cntp.reply.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private int commentNo;
	private int diaryNo;
	private int boardNo;
	private String writer;
	private String commentContent;
	private Date commentDate;
	private String status;
	
}
