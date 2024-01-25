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
	
	@RequestMapping(value = "/main.do")
	public String main(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.selectNewBoard(vo);
		
		model.addAttribute("newlist",list);
		
		return "index";
	}
	
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
			msg = vo.getCategory();
		} else {
			msg = "fail";
		}
		return msg;
	}
	
	@RequestMapping(value = "/boardList.do")
	public String selectBoardList(BoardVO vo, ModelMap model) throws Exception{
		
		int unit = 15;
		
		int total = boardService.selectBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage < 1) viewPage = 1;
		
		int startIndex = (viewPage - 1) * unit + 1;
		int endIndex = startIndex + (unit - 1);
		
		int startRowNo = total - (viewPage-1)*unit;
		 
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		String ctgy = "";
		String category = vo.getCategory();
		if(category == null) { category = ""; }
		switch (category) {
			case "b" : ctgy = "일반 게시판"; break;
			case "g" : ctgy = "고민 게시판"; break;
			case "h" : ctgy = "취미 게시판"; break;
			default : ctgy = "공지사항"; break;
		}
		
		List<?> list = boardService.selectBoardList(vo);
		
		model.addAttribute("searchCategory",vo.getCategory());
		model.addAttribute("titlecategory", ctgy);
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectBoardDetail(BoardVO vo, ModelMap model) throws Exception {
		
		boardService.updateBoardHits(vo.getUnq());
		
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent(); // \n
		boardVO.setContent(content.replace("\n", "<br>"));
		
		String categy = "";
		String ctgory = boardVO.getCategory();
		switch(ctgory) {
			case "b" : categy = "일반"; break;
			case "g" : categy = "고민"; break;
			case "h" : categy = "취미"; break;
			case "n" : categy = "공지"; break;
		}
		
		model.addAttribute("boardCT", categy);
		model.addAttribute("detailVO",boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String selectModifyBoard(int unq, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectModifyBoard(unq);
		
		String categy = "";
		String ctgory = boardVO.getCategory();
		switch(ctgory) {
			case "b" : categy = "일반"; break;
			case "g" : categy = "고민"; break;
			case "h" : categy = "취미"; break;
			case "n" : categy = "공지"; break;
		}
		model.addAttribute("ct",categy);
		model.addAttribute("BoardVO",boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateModifyBoard(BoardVO vo) throws Exception {
		
		int result = boardService.boardModifySave(vo);
		int cnt = 0;
		
		if(result == 1) {
			cnt = 1;
		} else {
			cnt = -1;
		}
		
		return cnt + "";
	}
	
	@RequestMapping("/deleteBoard.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception{
		
		int result = boardService.deleteBoard(vo);
		int cnt = 0;
		if(result == 1) {
			cnt = 1;
		} else {
			cnt = -1;
		}
		
		return cnt + "";
	}
}
