package com.kh.cntp.moim.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Team {
	
	private int teamNo;
	private String teamName;
	private int teamMember; // 팀 모집 인원
	private String teamIntro;
	private String teamArea;
	private String teamTime; // 올타임, 평일, 주말
	private String keyword;
	private Date createDate;
	private String badgeOriginName;
	private String badgeChangeName;
	private String badgeStatus;
	private String status;
	private Date powerDuration;
	

}
