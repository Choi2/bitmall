package com.cafe24.bitmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;


@Controller
@RequestMapping("/member")
@SessionAttributes("authMember")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "member/member_login";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			HttpSession session,
			@ModelAttribute MemberVo vo, 
			Model model) {
		System.out.println(vo);
		MemberVo authMember = memberService.getMember(vo);
		if(authMember == null) {
			model.addAttribute("result", "fail");
			return "redirect:/";
		}
		
		session.setAttribute("authMember", authMember); //인증처리
		return "redirect:/";
	}
	
	@RequestMapping(value="/member_agree", method=RequestMethod.GET)
	public String agree() {
		return "member/member_agree";
	}
	
	@RequestMapping(value="/member_join", method=RequestMethod.GET)
	public String join() {
		return "member/member_join";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute MemberVo vo) {
		System.out.println(vo);
		memberService.addMember(vo);
		return "member/member_joinend";
	}
	
}