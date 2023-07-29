package com.kh.cntp.member.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.cntp.member.model.service.MemberService;

@Component
public class CertScheduler {

    //Scheduling 기능을 적용하기 위해 작성한 service나 dao 등을 불러와서 작성
    @Autowired
    private MemberService memberService;
	
    //매주 월요일 12시 실행
    @Scheduled(cron = "* 0 12 * * MON")
    public void certDeleteAll() {
    	if(memberService.certDeleteAll() > 0) {
    		System.out.println("CertTable Delect success");
    	} else {
    		System.out.println("CertTable Delect fail");
    	}
    	
    }
}
