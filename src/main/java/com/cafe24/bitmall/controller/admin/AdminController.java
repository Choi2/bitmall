package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.OptionVo;

@Controller("adminMainController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired private OptionService optionService;

	@Auth(role=Role.ADMIN)
	@RequestMapping("/option")
	public String option(Model model) {
		List<OptionVo> list = optionService.getList();
		model.addAttribute("list", list);
		return "admin/option/opt";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/option/insert", method=RequestMethod.GET)
	public String optionNew() {
		return "admin/option/opt_new";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/option/insert", method=RequestMethod.POST)
	public String optionInsert(@ModelAttribute OptionVo vo) {
		optionService.insert(vo);
		return "redirect:/admin/option";
	}

	@Auth(role=Role.ADMIN)
	@RequestMapping("/faq")
	public String faq() {
		return "admin/faq";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping("/faq_new")
	public String faqNew() {
		return "admin/faq_new";
	}
	
}
