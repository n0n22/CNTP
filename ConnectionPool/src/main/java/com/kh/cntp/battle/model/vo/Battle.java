package com.kh.cntp.battle.model.vo;

import lombok.Data;

@Data
public class Battle {
	private String battleNo;	// 배틀번호
	private String area;		// 지역
	private String gender;		// 성별
	private String homeTeam;	// 홈팀()
	private String awayTeam;	// 어웨이팀(도전팀)
	private String level;		// 경기 수준
	private String battleDate;	// 경기 날짜
	private String originName;	// 원본 파일명
	private String changeName;	// 수정 파일명
	private String style;		// 경기종목
	private String title;		// 배틀풀 글 제목
	private String battleTime;	// 경기 시간
	private String battleRule;	// 경기 규칙
}
