package main.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import main.service.BoardVO;
@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public String insertBoardWrite(BoardVO vo) {
		return (String) insert("boardDAO.insertBoardWrite", vo);
	}

	public List<?> selectBoardList(BoardVO vo) {
		return list("boardDAO.selectBoardList", vo);
	}

	public int selectBoardTotal(BoardVO vo) {
		return (int) select("boardDAO.selectBoardTotal", vo);
	}

}
