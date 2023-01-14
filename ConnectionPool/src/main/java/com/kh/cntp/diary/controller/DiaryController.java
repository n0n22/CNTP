package com.kh.cntp.diary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.common.template.Template;
import com.kh.cntp.diary.model.service.DiaryService;
import com.kh.cntp.diary.model.vo.Diary;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	
	//수영일기 리스트 조회
	@RequestMapping("list.di")
	public ModelAndView selectList(ModelAndView mv) {
		mv.addObject("list",diaryService.selectList).setViewName("diary/diaryListView");
	
		return mv;
	}
	
	//수영일기 작성폼으로
	@RequestMapping("enrollForm.di")
	public String enrollForm() {
		return "diary/diaryEnrollForm";
	}
	
	//수영일기 작성폼
	@RequestMapping ("insert.di")
	public String insertDiary(Diary d, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			d.setOriginName(upfile.getOriginalFilename()); //원본명
			d.setChangeName("resources/uploadFiles/" + Template.saveFile(upfile, session));
		}
		 
		if(diaryService.insertDiary(d) >0) { //성공 => 게시글 리스트 페이지
		
			session.setAttribute("alertMsg", "게시글 등록 완료~~!");
			return "redirect:list.di";
		} else {
			model.addAttribute("errorMsg","게시글 작성 실패...");
			return "common/errorPage";
		}
		                               
	}
	
	//수영일기 상세보기
	@RequestMapping ("detail.bi")
	public ModelAndView selectDiary(ModelAndView mv, int dno) {
		
		if(diaryService.)		
		
		
		
		return mv;
	}
	
	
	//수영일기 삭제
	@RequestMapping("delete.di")
	public String deleteDiary(int bno, HttpSession session, Model model, String filePath) {
		
		if(diaryService.deleteDiary(bno) >0) { //삭제 성공
		
			if(!filePath.equals("")) { //첨부파일이 있을경우 기존의 첨부파일을 삭제.
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "삭제 성공~!!");
			return "redirect:list.di";
		} else {//삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패 ㅜㅜ");
			return "common/errorPage";
		}
			
			
	}
	
	//수영일기 업데이트폼으로 이동
	@RequestMapping("updateForm.di")
	public ModelAndView updateForm(int dno, ModelAndView mv) {
		mv.addObject("d", diaryService.selectDiary(dno)).setViewName("diary/diaryUpdate");
		return mv;
	}
	
	//수영일기 수정
	@RequestMapping("update.di")
	public String updateDiary(@ModelAttribute Board b ,Model model, MultipartFile reUpfile, HttpSession session ) {
		
		if(b.getOriginName() != null ) {
			new File(session.getSetvletContext().getRealPath(d.getchangeName())).delete();
		}
		
		//새로운 첨부파일을 서버에 업로드 시키기
		String changeName = Template.saveFile(reUpfile, session);
		
		//d라는 Diary객체에  새로운 정보 (원본명, 저장경로)담기
		d.setOriginName(reUpfile.getOriginalFilename());
		d.setChangeName("resources/uploadFiles/" + changeName);
	}	
		
	if(diaryService.updateDiary(d) > 0) {
		session.setAttribute("alertMsg", "게시글이 업데이트 되었습니다~~")
		return "redirect:detail.di?dno" + d.getDiaryNo();
		
	}else {
		model.addAttribute("errorMsg", "수정 실패야ㅜㅜ");
		return "common/errorPage";
	}
	
	
	
	
	
	
}
