package com.kh.cntp.moim.model.vo;

import lombok.Data;

@Data
public class TeamMember {
	
	private String teamNo;
	private int memNo;
	private String nickname;
	private String teamGrade;
	private String teamEnrollDate;
	private String grade; // 채팅에 등급을 가져가려고 어쩔 수 없이 추가했습니다 ㅠㅠ
	
}
