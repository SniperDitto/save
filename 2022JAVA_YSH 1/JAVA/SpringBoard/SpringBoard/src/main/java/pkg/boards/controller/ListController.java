package pkg.boards.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.boards.DAO.ListDAO;
import pkg.boards.VO.BoardVO;

@Controller
public class ListController {
	
	@Autowired
	private ListDAO listDAO;
	
	@RequestMapping("list")
	public String boardList(String idx, Model model) {
		//List<BoardVO> list = listDAO.getBoardList("");
		Map<String, Object> map = listDAO.getProcBoardList("");
		List<BoardVO> list = (List<BoardVO>) map.get("result");
		model.addAttribute("list",list);
		return "/boards/boardList";
	}
	
	
	
	
	
}
