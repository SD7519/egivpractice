package main.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite() throws Exception {
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/boardWriteSave.do")
	@ResponseBody
	public String boardWriteSave(BoardVO vo) throws Exception {
				
		String msg;
		String result = boardService.boardWriteSave(vo);
		if(result == null) {
			msg = "ok";
		} else {
			msg = "fail";
		}
		return msg;
	}
	
	@RequestMapping(value = "/boardList.do")
	public String selectBoardList(BoardVO vo, ModelMap model) throws Exception{
		
		int unit = 10;
		
		int total = boardService.selectBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage < 1) viewPage = 1;
		
		int startIndex = (viewPage - 1) * unit + 1;
		int endIndex = startIndex + (unit - 1);
		
		int startRowNo = total - (viewPage-1)*unit;
		 
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectBoardList(vo);
		
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		
		return "board/boardList";
	}
}
