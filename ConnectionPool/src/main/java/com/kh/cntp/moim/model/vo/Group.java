package com.kh.cntp.moim.model.vo;

import lombok.Data;

@Data
public class Group {
	
	private String groupNo;
	private int memNo;
	private String groupTitle;
	private String groupContent;
	private String groupArea;
	private String place;
	private int groupMember; //모임 모집 인원
	private String startTime;
	private String endTime;
	private String originName;
	private String changeName;
	private String level; // 무관, 초급, 중급, 고급
	private String gender;
	private String createDate;
	private String powerDuration; // 파워지속 끝나는 날

}
