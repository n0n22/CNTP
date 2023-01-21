package com.kh.cntp.member.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.kh.cntp.member.model.service.MemberService;

public class CertScheduler {

    //Scheduling 기능을 적용하기 위해 작성한 service나 dao 등을 불러와서 작성
    
    @Autowired
    private MemberService memberService;
	
    //1시간마다 DELETE
    @Scheduled(cron = "0 0 0/1 1/1 * ?")
    public void certDeleteAll() {
    	memberService.certDeleteAll();
    }
}
