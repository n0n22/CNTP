package com.kh.cntp.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cntp.board.model.service.BoardService;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	//커뮤니티게시판 조회
	@RequestMapping ("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService. selectListCount(),currentPage, 5,3); //int pageLimit 5, int boardLimit : 3
		mv.addObject("pi", pi).addObject("list", boardService.selectList(pi)).setViewName("board/boardListView");
		
		return mv;
	}
	
	//커뮤니티게시판 작성폼으로 이동
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		
		return "board/boardEnrollForm";
	}
	
	
	//커뮤니티게시판 작성
	@RequestMapping("insert.bo")
	public String insertBoard() {
		
		return "redirect:list.bo";
				
	}
	
	//커뮤니티게시판 상세보기
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(ModelAndView mv) {
		
		return mv;
	}
	
	
	//커뮤니티게시판 삭제
	@RequestMapping ("delete.bo")
	public String deleteBoard() {
		
		return "redirect:list.bo";
	}
	
	
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(ModelAndView mv) {
		
		return mv;
	}
	
	//커뮤니티게시판 수정 
	@RequestMapping("update.bo")
	public String updateBoard() {
		
		return "redirect:detail";
	}
	
	
	
	
	
	
	
	
	
}
