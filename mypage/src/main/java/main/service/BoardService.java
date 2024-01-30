package main.service;

import java.util.List;

public interface BoardService {
	public String boardWriteSave(BoardVO vo) throws Exception;
	public List<?> selectBoardList(BoardVO vo) throws Exception;
	public int selectBoardTotal(BoardVO vo) throws Exception;
	public BoardVO selectBoardDetail(int unq) throws Exception;
	public int updateBoardHits(int unq) throws Exception;
	public BoardVO selectModifyBoard(int unq) throws Exception;
	public int boardModifySave(BoardVO vo) throws Exception;
	public int deleteBoard(BoardVO vo) throws Exception;
	public List<?> selectNewBoard(BoardVO vo) throws Exception;
	public int updateBoardRcm(int unq) throws Exception;
	public List<?> selectBestBoard(BoardVO vo) throws Exception;
	
	public String insertReply(ReplyVO ro) throws Exception;
	public List<?> selectReplyList(ReplyVO ro) throws Exception;
	public int deleteReply(ReplyVO ro) throws Exception;
	
	public String fileSave(FileVO fo) throws Exception;
}
