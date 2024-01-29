package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;
import main.service.ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Resource(name = "boardDAO")
	public BoardDAO boardDAO;

	@Override
	public String boardWriteSave(BoardVO vo) throws Exception {
		return boardDAO.insertBoardWrite(vo);
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public int selectBoardTotal(BoardVO vo) throws Exception {
		return boardDAO.selectBoardTotal(vo);
	}

	@Override
	public BoardVO selectBoardDetail(int unq) throws Exception {
		return boardDAO.selectBoardDetail(unq);
	}

	@Override
	public int updateBoardHits(int unq) throws Exception {
		return boardDAO.updateBoardHits(unq);
	}

	@Override
	public BoardVO selectModifyBoard(int unq) throws Exception {
		return boardDAO.selectModifyBoard(unq);
	}

	@Override
	public int boardModifySave(BoardVO vo) throws Exception {
		return boardDAO.updateModifyBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteboard(vo);
	}

	@Override
	public List<?> selectNewBoard(BoardVO vo) throws Exception {
		return boardDAO.selectNewBoard(vo);
	}

	@Override
	public List<?> selectReplyList(ReplyVO ro) throws Exception {
		return boardDAO.selectReplyList(ro);
	}

	@Override
	public String insertReply(ReplyVO ro) throws Exception {
		return boardDAO.insertReply(ro);
	}

	@Override
	public int deleteReply(ReplyVO ro) throws Exception {
		return boardDAO.deleteReply(ro);
	}

	@Override
	public int updateBoardRcm(int unq) throws Exception {
		return boardDAO.updateBoardRcm(unq);
	}

	@Override
	public List<?> selectBestBoard(BoardVO vo) throws Exception {
		return boardDAO.selectBestBoard(vo);
	}
}
