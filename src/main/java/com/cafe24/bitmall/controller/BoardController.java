package com.cafe24.bitmall.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.BoardService;
import com.cafe24.bitmall.vo.BoardVo;
import com.cafe24.bitmall.vo.CommentVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.Pager;

@Controller
@RequestMapping("/board")
@SessionAttributes("userMember")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Log LOG = LogFactory.getLog( BoardController.class );
	
	@RequestMapping("")
	public String list(Model model,  Pager pager) {

		List<BoardVo> list = boardService.getAllBoardList(pager);
		pager = boardService.getPager();
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

		System.out.println(pager);

		
		return "board/list";
	}
	
	@RequestMapping("/{no}")
	public String view(Model model, @PathVariable("no") long no) {
		
		boardService.updateReadCount(no);
		BoardVo vo = boardService.getOneBoard(no);
		List<CommentVo> commentList = boardService.getCommentList(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("commentList", commentList);
		
		return "board/view";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(@ModelAttribute MemberVo vo) {

		if(vo == null) {
			return "user/login";
		}
		
		return "board/write"; //check
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(
			@ModelAttribute MemberVo vo,
			@ModelAttribute BoardVo board,
			Model model) {

		boardService.arrangeList(board);
		boardService.writeBoard(board, vo.getNo());

		return "redirect:/board";
	}
	
	
	@RequestMapping(value="/modify/{no}", method = RequestMethod.GET)
	public String modify(
			@ModelAttribute MemberVo user,
			@PathVariable ("no") long no,
			Model model) {
		
		BoardVo board = boardService.getOneBoard(no);
		
		if(user == null || user.getNo() != board.getUserNo()) {
			return "member/login";
		}
		
		model.addAttribute("vo", board);
		return "board/modify";
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute BoardVo vo) {
		boardService.modifyBoard(vo);
		return "redirect:/board";
	}
	
	@RequestMapping(value="/delete/{no}", method = RequestMethod.GET)
	public String delete(@ModelAttribute MemberVo user,
			@PathVariable long no) {
		
		BoardVo vo = boardService.getOneBoard(no);
		
		if(user == null || user.getNo() != vo.getUserNo()) {
			return "member/login";
		}
		
		boardService.deleteBoard(no);
		return "redirect:/board";
	}
}