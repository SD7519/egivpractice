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
}
