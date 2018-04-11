package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OptionVo;

@Controller("adminMainController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired private MemberService memberService;
	@Autowired private CategoryService categoryService;
	@Autowired private OptionService optionService;
	
	
	@RequestMapping("/member")
	public String member(Model model) {
		List<MemberVo> list = memberService.getList();
		model.addAttribute("list", list);
		return "admin/member";
	}
	
	@RequestMapping("/jumun")
	public String jumun() {
		return "admin/jumun";
	}
	
	
	@RequestMapping("/option")
	public String option(Model model) {
		List<OptionVo> list = optionService.getList();
		model.addAttribute("list", list);
		return "admin/opt";
	}
	
	@RequestMapping(value="/option/insert", method=RequestMethod.GET)
	public String optionNew() {
		return "admin/opt_new";
	}
	
	@RequestMapping(value="/option/insert", method=RequestMethod.POST)
	public String optionInsert(@ModelAttribute OptionVo vo) {
		optionService.insert(vo);
		return "redirect:/admin/option/insert";
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
