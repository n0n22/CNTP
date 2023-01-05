package com.kh.cntp.board.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String category;
	private String title;
	private String content;
	private int writer;
	private Date createDate;
	private String originName;
	private String changeName;
	private int count;
	private String status;
	

}
