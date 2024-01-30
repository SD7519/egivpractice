package main.service.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import main.service.BoardService;
import main.service.BoardVO;
import main.service.FileVO;
import main.service.ReplyVO;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/main.do")
	public String main(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.selectNewBoard(vo);
		List<?> best = boardService.selectBestBoard(vo);
		
		model.addAttribute("newlist",list);
		model.addAttribute("bestlist",best);
		
		return "index";
	}
	
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite() throws Exception {
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/boardWriteSave.do")
	@ResponseBody
	public String boardWriteSave(BoardVO vo, FileVO fo, @RequestPart("file") MultipartFile file) throws Exception {
		
		String savedFileName = "";
        // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
        String uploadPath = "C:\\dev\\UploadFile";
        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();
        // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid + "_" + originalFileName;
        // 4. 파일 생성
        File file1 = new File(uploadPath, savedFileName);
        // 5. 서버로 전송
        file.transferTo(file1);
		
		String msg;
		String result = boardService.boardWriteSave(vo);
		
		fo.setBno(vo.getUnq());
		fo.setFilepath(uploadPath);
		fo.setOrgfilename(originalFileName);
		fo.setSavefilename(savedFileName);
		boardService.fileSave(fo);
		
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
	public String selectBoardDetail(BoardVO vo, ModelMap model, ReplyVO ro) throws Exception {
		
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
		
		List<?> list = boardService.selectReplyList(ro);
		
		model.addAttribute("replyVO",list);
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
	public String updateModifyBoard(BoardVO vo, CommonsMultipartFile file) throws Exception {
		
	 	String savedFileName = "";
        // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
        String uploadPath = "/dev/UploadFile";
        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();
        // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid.toString() + "_" + originalFileName;
        // 4. 파일 생성
        File file1 = new File(uploadPath + savedFileName);
        // 5. 서버로 전송
        file.transferTo(file1);
        
		
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
	
	@RequestMapping("/insertReply.do")
	@ResponseBody
	public String insertReply(ReplyVO ro) throws Exception {
		
		String result = boardService.insertReply(ro);
		String msg = "";
		if(result == null) {
			msg = "ok";
		} else {
			msg = "fail";
		}
		
		return msg;
	}

	@RequestMapping("/deleteReply.do")
	@ResponseBody
	public String deleteReply(ReplyVO ro) throws Exception {
		
		int result = boardService.deleteReply(ro);
		int msg;
		if(result == 1) {
			msg = 1;
		} else {
			msg = -1;
		}
		
		return msg+"";
	}
	
	@RequestMapping("/updateRcm.do")
	@ResponseBody
	public String updateRcm(int unq) throws Exception {
		
		int result = boardService.updateBoardRcm(unq);
		int cnt;
		System.out.println(result);
		if(result == 1) {
			cnt = 1;
		} else {
			cnt = -1;
		}
		return cnt+"";
	}
}
