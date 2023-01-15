package com.kh.cntp.member.model.vo;

import lombok.Data;

@Data	
public class Point {
	
	private int pointNo; //POINT_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private String pointContent; //POINT_CONTENT	VARCHAR2(100 BYTE)
	private String point; //POINT	VARCHAR2(20 BYTE)
	private String pointDate; //POINT_DATE	DATE
	private String category; // 적립, 사용 , 전체 식별용

}
