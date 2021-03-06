package pkg.boards.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.boards.VO.BoardVO;
import pkg.boards.VO.MemberVO;
import pkg.boards.service.BoardsService;

@Controller
public class BoardsController {
	
	@Autowired
	private BoardsService boardService;
	
	@RequestMapping("boardsList")
	public String goBoards(Model model) {
		//데이터 가져오기
		ArrayList<BoardVO> boardList = boardService.getBoardList("");
		ArrayList<MemberVO> memberList = boardService.getMemberList("");
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		
		return "/boards/boards";
	}
	
	@RequestMapping("saveBoard")
	public String saveBoard(String[] idx2, String[] title2, String[] userID2, String[] status2, Model model) {
		/*
		for(String s : title2) {
			System.out.println(s);
		}
		for(String s : userID2) {
			System.out.println(s);
		}
		*/
		boardService.saveBoard(idx2, title2, userID2, status2);
		
		ArrayList<BoardVO> boardList = boardService.getBoardList("");
		ArrayList<MemberVO> memberList = boardService.getMemberList("");
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		
		return "/boards/boards";
	}
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(String[] delIdx, Model model) {
		boardService.deleteBoard(delIdx);
		
		ArrayList<BoardVO> boardList = boardService.getBoardList("");
		ArrayList<MemberVO> memberList = boardService.getMemberList("");
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		
		return "/boards/boards";
	}
	
}
