package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OptionVo;
import com.cafe24.bitmall.vo.OrderVo;

@Controller("adminMainController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired private MemberService memberService;
	@Autowired private OptionService optionService;

	
	
	@RequestMapping("/member")
	public String member(Model model) {
		List<MemberVo> list = memberService.getList();
		model.addAttribute("list", list);
		return "admin/member";
	}
	

	@RequestMapping("/option")
	public String option(Model model) {
		List<OptionVo> list = optionService.getList();
		model.addAttribute("list", list);
		return "admin/option/opt";
	}
	
	@RequestMapping(value="/option/insert", method=RequestMethod.GET)
	public String optionNew() {
		return "admin/option/opt_new";
	}
	
	@RequestMapping(value="/option/insert", method=RequestMethod.POST)
	public String optionInsert(@ModelAttribute OptionVo vo) {
		optionService.insert(vo);
		return "redirect:/admin/option";
	}
	
	

	@RequestMapping("/faq")
	public String faq() {
		return "admin/faq";
	}
	
	@RequestMapping("/faq_new")
	public String faqNew() {
		return "admin/faq_new";
	}
	
	
}
