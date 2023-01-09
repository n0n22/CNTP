package com.kh.cntp.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private int memNo; //	MEM_NO	NUMBER
	private String memId; // MEM_ID	VARCHAR2(30 BYTE)
	private String memPwd; //	MEM_PWD	VARCHAR2(100 BYTE)
	private String gender; //	GENDER	CHAR(1 BYTE)
	private int ingido; //	INGIDO	NUMBER
	private int memPoint; //	MEM_POINT	NUMBER
	private String email; //	EMAIL	VARCHAR2(100 BYTE)
	private String nickName; //	NICKNAME	VARCHAR2(30 BYTE)
	private String memName; //	MEM_NAME	VARCHAR2(10 BYTE)
	private String memArea; //	MEM_AREA	VARCHAR2(10 BYTE)
	private String phone; //	PHONE	VARCHAR2(13 BYTE)
	private Date birthDay; //	BIRTHDAY	DATE
	private String detailArea; //	DETAIL_AREA	VARCHAR2(30 BYTE)
	private String memStatus; //	MEM_STATUS	CHAR(1 BYTE)
	private Date enrollDate; //	ENROLL_DATE	DATE
	private String grade; //	GRADE	CHAR(1 BYTE)
	private Date endDate; //  END_DATE DATE 일단 데이트로 받아보고 어려우면 스트링으로 변경하겠습니다	
	
	















	
	

	
	

}
