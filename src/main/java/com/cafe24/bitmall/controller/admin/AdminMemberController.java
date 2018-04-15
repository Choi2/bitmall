package com.cafe24.bitmall.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired private MemberService memberService;
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("")
	public String member(Model model) {
		List<MemberVo> list = memberService.getList();
		model.addAttribute("list", list);
		return "admin/member/list";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/modify")
	public String memberModifyForm(
			@RequestParam("no") long memberNo,
			Model model) {
		MemberVo member = memberService.getMember(memberNo);
		model.addAttribute("vo", member);
		return "admin/member/modify";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/delete")
	public String memberDelete(
			@RequestParam("no") long memberNo) {
		memberService.delete(memberNo);
		return "redirect:/admin/member";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "admin/member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			HttpSession session,
			@ModelAttribute MemberVo vo, 
			Model model) {
		MemberVo authMember = memberService.getMember(vo);

		if(authMember == null || "root".equals(authMember.getId()) == false) {
			model.addAttribute("result", "fail");
			return "redirect:/admin/member/login";
		}
		
		session.setAttribute("authMember", authMember); //인증처리
		return "redirect:/admin/product";
	}
	
}
