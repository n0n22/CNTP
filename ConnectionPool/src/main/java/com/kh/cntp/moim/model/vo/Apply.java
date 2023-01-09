package com.kh.cntp.moim.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Apply {
	private int applyNo;
	private int moimNo;
	private int memNo;
	private String acceptYn;
	private String applyDate;
	private String acceptDate;
}
