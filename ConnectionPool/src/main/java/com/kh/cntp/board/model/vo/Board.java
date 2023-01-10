package com.kh.cntp.board.model.vo;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private int memberNo;
	private String category;
	private String title;
	private String content;
	private String createDate; //Date타입에서 String타입으로 변경
	private String originName;
	private String changeName;
	private int count;
	private String status;
	

}
