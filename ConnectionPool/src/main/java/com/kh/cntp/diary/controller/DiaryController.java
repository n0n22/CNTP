package com.kh.cntp.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.diary.model.service.DiaryService;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	
	//수영일기 리스트 조회
	@RequestMapping("list.di")
	public String selectList() {
		
	
		return "diary/diaryListView";
	}
	
	//수영일기 작성폼으로
	@RequestMapping("enrollForm.di")
	public String enrollForm() {
		
		return "diary/biaryEnrollForm";
	}
	
	//수영일기 작성폼
	@RequestMapping ("insert.di")
	public String insertDiary() {
		
		return "redirect:list.di";
	}
	
	//수영일기 상세보기
	@RequestMapping ("detail.bo")
	public ModelAndView selectDiary(ModelAndView mv) {
		
		return mv;
	}
	
	
	//수영일기 삭제
	@RequestMapping("delete.di")
	public String deleteDiary() {
		
		return "redirect:list.bo";
	}
	
	//수영일기 업데이트폼으로 이동
	@RequestMapping("updateForm.di")
	public ModelAndView updateForm(ModelAndView mv) {
		
		return mv;
	}
	
	//수영일기 수정
	@RequestMapping("update.di")
	public String updateDiary() {
		
		return "redirect:retail.di";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
