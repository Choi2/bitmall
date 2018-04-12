package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.vo.ItemVo;

@Controller
@RequestMapping("/order")
@SessionAttributes("authMember")
public class OrderController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("")
	public String orderForm(
			@RequestParam("itemNo") long no,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		model.addAttribute("vo", vo);
		return "order/order";
	}
	
	
}
