package com.kh.cntp.reply.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private int commentNo; //댓글번호
	private int diaryNo; //수영일기번호
	private int boardNo; //게시판번호
	private String writer; //작성자
	private String commentContent; //댓글내용
	private String commentDate; //댓글작성일
	private String status; //상태
	
}
