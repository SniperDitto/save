package pkg.test.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pkg.test.board.DTO.BoardDTO;
import pkg.test.board.service.BoardService;

import java.util.List;

@Controller
public class BoardController {
	
	private BoardService boardService;
	@Autowired
	public BoardController(BoardService boardService){
		this.boardService=boardService;
	}
	
	@RequestMapping("boardList")
	public String boardList(String title, Model model){
		
		List<BoardDTO> list = boardService.getBoardList(title);
		model.addAttribute("boardList",list);
		
		return "board/boardList";
	}
	
}
