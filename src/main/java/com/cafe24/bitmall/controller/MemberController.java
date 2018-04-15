package com.cafe24.bitmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
		MemberVo authMember = memberService.getMember(vo);
		if(authMember == null) {
			model.addAttribute("result", "fail");
			return "redirect:/member/login";
		}
		
		session.setAttribute("authMember", authMember); //인증처리
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/"; 
	}
	
	@ResponseBody
	@RequestMapping(value="/same", method=RequestMethod.POST)
	public MemberVo sameMember(
			@ModelAttribute("authMember") MemberVo authMember) {
		return authMember;
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
		memberService.addMember(vo);
		return "member/member_joinend";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(
			@ModelAttribute("authMember") MemberVo member,
			Model model) {

		String phone[] = member.getPhone().split("-");
		String cellphone[] = member.getCellphone().split("-");

		model.addAttribute("phone", phone);
		model.addAttribute("cellphone", cellphone);
		model.addAttribute("vo", member);
		return "member/modify";
	} //회원 정보 수정
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifying(
			@ModelAttribute MemberVo member) {
		memberService.modifyMember(member);
		return "member/modifying";
	} //회원 정보 수정
	
}
