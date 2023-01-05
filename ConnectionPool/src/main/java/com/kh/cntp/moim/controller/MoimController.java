package com.kh.cntp.moim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoimController {
	
	// 임시적으로 moim 줄여서 mm해뒀는데 나중에 바꿔요 ....
	@RequestMapping("teamEnrollForm.mm")
	public String teamEnrollFrom() {
		return "moim/teamEnrollForm";
	}

}
