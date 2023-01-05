package com.kh.cntp.moim.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Group {
	
	private int groupNo;
	private String groupArea;
	private String place;
	private int groupMember; //모임 모집 인원
	private String startTime;
	private String endTime;
	private String level; // 무관, 초급, 중급, 고급
	private String gender;
	private Date createDate;
	private Date powerDuration; // 파워지속 끝나는 날

}