package com.kh.cntp.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.cntp.reply.model.service.ReplyService;
import com.kh.cntp.reply.model.vo.Reply;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	/*
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		return new Gson().toJson(replyService.selectReplyList(bno));
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		return replyService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value = "topList.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(replyService.selectTopBoard());
	}

	*/
	
	
	
}
