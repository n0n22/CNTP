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
	
	
	//Board댓글
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxBoardSelectReplyList(int bno) {
		return new Gson().toJson(replyService.BoardselectReplyList(bno));
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxBoardInsertReply(Reply r) {
		return replyService.BoardinsertReply(r) > 0 ? "success" : "fail";
	}
	
	

	
	//수영일기 댓글
	@ResponseBody
	@RequestMapping(value = "rlist.di", produces="application/json; charset=UTF-8")
	public String ajaxDiarySelectDiaryReplyList(int dno) {
		return new Gson().toJson(replyService.DiaryselectReplyList(dno));
	}
	
	@ResponseBody
	@RequestMapping("rinsert.di")
	public String ajaxDiaryInsertReply(Reply r) {
		return replyService.DiaryinsertReply(r) > 0 ? "success" : "fail";
	}
	
	

	
	
}
