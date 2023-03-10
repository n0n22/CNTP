package com.kh.cntp.battle.model.vo;

import lombok.Data;

@Data
public class ResultHistory {
	private String teamNo;
	private String teamName;
	private String badge;
	private int winningStreak;
	private int losingStreak;
	private int victory;
	private int defeat;
	private int record;
	private double winRate;
}
