package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.BoardDao;
import com.cafe24.bitmall.vo.BoardVo;
import com.cafe24.bitmall.vo.CommentVo;
import com.cafe24.bitmall.vo.Pager;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	private Pager pager;
	
	
	public List<BoardVo> getAllBoardList(Pager pager) {

		if(pager.getWord() == null || pager.getWord().equals("")) {
			pager.setWord(null);
		}
		
		pager.setPage(pager.getPage());
		pager.setTotalCount(boardDao.getPageSize(pager));
		pager.calculate(pager.getPage());

		this.pager = pager;
		return boardDao.getAllList(pager);
	}

	public Pager getPager() {
		return this.pager;
	}
	

	public void updateReadCount(long no) {
		boardDao.updateReadCount(no);
	}

	public BoardVo getOneBoard(long no) {
		return boardDao.getOneList(no);
	}

	public List<CommentVo> getCommentList(long no) {
		return boardDao.getCommentList(no);
	}

	public void writeBoard(BoardVo vo, Long memberNo) {
		vo.setMemberNo(memberNo);
		boardDao.insert(vo);
	}

	public void modifyBoard(BoardVo vo) {
		boardDao.update(vo);
	}

	public void deleteBoard(long no) {
		boardDao.delete(no);
	}

	public void arrangeList(BoardVo vo) {
		boardDao.arrangeList(vo);
	}

}
