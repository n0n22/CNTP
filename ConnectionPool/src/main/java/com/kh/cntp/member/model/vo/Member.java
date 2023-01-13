package com.kh.cntp.member.model.vo;

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
	private String birthDay; //	BIRTHDAY	DATE
	private String detailArea; //	DETAIL_AREA	VARCHAR2(30 BYTE)
	private String memStatus; //	MEM_STATUS	CHAR(1 BYTE)
	private String enrollDate; //	ENROLL_DATE	DATE
	private String grade; //	GRADE	CHAR(1 BYTE)
	private String endDate; //  END_DATE DATE 
	private String teamNo; //팀번호
	private String teamName; // 팀 이름
	private String teamGrade; // 팀직급
	private String badgeChangeName; // 팀 뱃지
	private int failCnt; // 로그인 횟수
	
	















	
	

	
	

}
