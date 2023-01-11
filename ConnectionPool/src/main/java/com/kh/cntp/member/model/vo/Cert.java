package com.kh.cntp.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @Builder @AllArgsConstructor
public class Cert {
	
	private String certIp; //CERT_IP VARCHAR2(24) NOT NULL,
	private String secretNo; //SECRET_NO VARCHAR(6) NOT NULL,
	private String validTime; //VALID_TIME DATE NOT NULL
	
}
