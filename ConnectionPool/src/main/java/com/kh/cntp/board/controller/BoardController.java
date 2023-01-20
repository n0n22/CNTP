package com.kh.cntp.board.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.cntp.board.model.service.BoardService;
import com.kh.cntp.board.model.vo.Board;
import com.kh.cntp.common.model.vo.PageInfo;
import com.kh.cntp.common.template.Pagination;
import com.kh.cntp.common.template.Template;
import com.kh.cntp.reply.model.vo.Reply;

import oracle.net.aso.b;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	//커뮤니티게시판 조회
	@RequestMapping ("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService. selectListCount(),currentPage, 10,5); //int pageLimit 10, int boardLimit : 5
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
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			b.setOriginName(upfile.getOriginalFilename()); //원본명
			b.setChangeName("/resources/upfiles/" + Template.saveFile(upfile, session));
		
		
		}
		
		if(boardService.insertBoard(b) > 0) {// 성공 => 게시글 리스트 페이지로 보내라.
			session.setAttribute("alertMsg", "게시글 등록 성공~~완료~~~");
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패ㅜㅜ");
			return "common/errorPage";
		}
	
	}
	
	
	//커뮤니티게시판 상세보기
		@RequestMapping("detail.bo")
		public ModelAndView selectBoard(ModelAndView mv, int bno) {
			
			if(boardService.increaseCount(bno) >0) {
				mv.addObject("b", boardService.selectBoard(bno)).setViewName("board/boardDetailView");
				
			}else {
				mv.addObject("errorMsg", "상세조회실패!!!ㅜㅜ").setViewName("common/errorPage");
			}
			
			return mv;
		}
		
		
		//커뮤니티게시판 삭제
		@RequestMapping ("delete.bo")
		public String deleteBoard(int bno, HttpSession session, Model model, String filePath) {
			
			if(boardService.deleteBoard(bno) > 0) { //삭제 성공
			
				if(!filePath.equals("")) { //만약 첨부파일이 존재했을 경우 기존의 파일을 삭제.
				
					new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "삭제 성공~~");	
				return "redirect:list.bo";
		}else { //삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
		@RequestMapping("updateForm.bo")
		public ModelAndView updateForm(int bno, ModelAndView mv) {
			mv.addObject("b",boardService.selectBoard(bno)).setViewName("board/boardUpdateForm");
			return mv;
		}
		
		//커뮤니티게시판 수정 
		@RequestMapping("update.bo")
		public String updateBoard(@ModelAttribute Board b, Model model, MultipartFile reUpfile, HttpSession session) {
			
			if(!reUpfile.getOriginalFilename().contentEquals("")) {
				
				//기존의 첨부파일이 있으면 기존의 첨부파일을 삭제
				if(b.getOriginName() != null) {
					new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
				}
				
				//새로 넘어온 첨부파일 서버 업로드 시키기
				 String changeName = Template.saveFile(reUpfile, session);
				
				//b라는 보드 객체에 새로운 정보(원본명, 저장경로) 담기
				 b.setOriginName(reUpfile.getOriginalFilename());
				 b.setChangeName("resources/uploadFiles/" + changeName);
			}
			
			if(boardService.updateBoard(b) > 0) {
				session.setAttribute("alertMsg", "게시글이 수정되었습니다~~");
				return "redirect:detail.bo?bno=" + b.getBoardNo();
			}else {
				model.addAttribute("errorMsg", "게시글 수정 실패~~!!");
				return "common/errorPage";
			}
			
		}
		
		//검색 -> 작성자, 제목, 내용
		//작성자 -> memberNo ? / nickName? 
		@RequestMapping("SearchNick.bo")
		public ModelAndView mSearch(String condition, String keyword,  ModelAndView mv,@RequestParam(value="cpage",defaultValue="1") int currentPage ) {
			
			HashMap<String, String> map= new HashMap();
			map.put("condition", condition);
			map.put("keyword", keyword);
			
			PageInfo pi = Pagination.getPageInfo(boardService.selectSearchCount(map),currentPage, 10,5); //int pageLimit 10, int boardLimit : 5
			//System.out.println(boardService.selectSearchCount(map));
			mv.addObject("pi", pi).addObject("list", boardService.selectSearchList(map, pi)).setViewName("board/boardListView");
			
			 
			
			return mv;
		
		}
			
		
		
}



