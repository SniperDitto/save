package pkg.boards.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pkg.boards.VO.BoardVO;
import pkg.boards.service.BoardService;

//@Controller
public class BoardController2{
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/helloSpring")
	public ModelAndView YoonaBabo() {
		
		
		String data = "최밥창문";
		String data2 = "바보";
		String jspPage = "index.jsp";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data",data);//받아낼 이름, 붙일 데이터
		mv.addObject("data2",data2);
		mv.setViewName(jspPage);
		
		return mv;
	}
	
	@RequestMapping("/wanZZang.recording")
	public ModelAndView getWanZZang() {
		String data = "완짱";
		String data2 = "앗쉬발녹화중인데";
		String jspPage = "index.jsp";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data",data);//받아낼 이름, 붙일 데이터
		mv.addObject("data2",data2);
		mv.setViewName(jspPage);
		
		return mv;
	}
	
	@RequestMapping("/boardList")
	public String getBoardList(String idx, String userID, Model model) {
		System.out.println("/boardList");
		
		ArrayList<BoardVO> boards = boardService.getBoardList();
		
		for(BoardVO vo : boards) {
			System.out.println(vo.getIdx());
			System.out.println(vo.getTitle());
			System.out.println(vo.getUserID());
		}
		
		model.addAttribute("boards",boards);
		
		return "/boards/list";
	}
	
	@RequestMapping("/boardWrite")
	public String getWritePage() {
		
		
		return "/boards/write";
	}
	
	@RequestMapping("/boardInsert")
	public String insertBoard(BoardVO vo, Model model) {
		System.out.println("insert "+vo.getTitle());
		
		//boardService.insertBoard(vo);
		ArrayList<BoardVO> boards = boardService.getBoardList();
		boards.add(vo);
		
		for(BoardVO v : boards) {
			System.out.println(v.getIdx());
			System.out.println(v.getTitle());
			System.out.println(v.getUserID());
		}
		
		model.addAttribute("boards",boards);
		
		return "/boards/list";
	}
	
	@RequestMapping("/boardDelete")
	public String deleteBoard(String idx, Model model) {
		System.out.println("deleteBoard");
		
		boardService.deleteBoard(idx);
		
		ArrayList<BoardVO> boards = boardService.getBoardList();
		for(BoardVO v : boards) {
			System.out.println(v.getIdx());
			System.out.println(v.getTitle());
			System.out.println(v.getUserID());
		}
		
		model.addAttribute("boards",boards);
		
		return "/boards/list";
	}
	
}
