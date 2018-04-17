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

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.BoardService;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.vo.BoardVo;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.CommentVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.Pager;

@Controller
@RequestMapping("/board")
@SessionAttributes("authMember")
public class BoardController {
	
	@Autowired private BoardService boardService;
	@Autowired private CategoryService categoryService;
	
	private static final Log LOG = LogFactory.getLog( BoardController.class );
	
	@RequestMapping("")
	public String list(Model model,  Pager pager) {

		List<BoardVo> list = boardService.getAllBoardList(pager);
		List<CategoryVo> categoryList = categoryService.getList();
		pager = boardService.getPager();
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("categoryList", categoryList);
	
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
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(@ModelAttribute MemberVo vo) {

		if(vo == null) {
			return "user/login";
		}
		
		return "board/write"; //check
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(
			@ModelAttribute("authMember") MemberVo vo,
			@ModelAttribute BoardVo board,
			Model model) {

		boardService.arrangeList(board);
		boardService.writeBoard(board, vo.getNo());

		return "redirect:/board";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/modify/{no}", method = RequestMethod.GET)
	public String modify(
			@ModelAttribute MemberVo user,
			@PathVariable ("no") long no,
			Model model) {
		
		BoardVo board = boardService.getOneBoard(no);
		
		if(user == null || user.getNo() != board.getMemberNo()) {
			return "member/login";
		}
		
		model.addAttribute("vo", board);
		return "board/modify";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute BoardVo vo) {
		boardService.modifyBoard(vo);
		return "redirect:/board";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/delete/{no}", method = RequestMethod.GET)
	public String delete(@ModelAttribute MemberVo user,
			@PathVariable long no) {
		
		BoardVo vo = boardService.getOneBoard(no);
		
		if(user == null || user.getNo() != vo.getMemberNo()) {
			return "member/login";
		}
		
		boardService.deleteBoard(no);
		return "redirect:/board";
	}
}
