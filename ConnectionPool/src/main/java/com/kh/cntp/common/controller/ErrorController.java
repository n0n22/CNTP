package com.kh.cntp.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("/400")
	public String error400() {
		return "error/400";
	}
	@RequestMapping("/404")
	public String error404() {
		return "error/404";
	}
	@RequestMapping("/500")
	public String error500() {
		return "error/500";
	}
	@RequestMapping("/505")
	public String error505() {
		return "error/505";
	}
}
