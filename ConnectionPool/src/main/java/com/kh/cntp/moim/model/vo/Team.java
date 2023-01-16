package com.kh.cntp.moim.model.vo;

import lombok.Data;

@Data
public class Team {
	
	private String teamNo;
	private String teamName;
	private int memNo; // 번호
	private String nickname; // 번호
	private String teamMember; // 팀 모집 인원
	private String teamIntro;
	private String originName;
	private String changeName;
	private String teamArea;
	private String teamTime; // 올타임, 평일, 주말
	private String keyword;
	private String createDate;
	private String badgeOriginName;
	private String badgeChangeName;
	private String badgeStatus;
	private String status;
	private String powerDuration;
	private String korArea;

}
