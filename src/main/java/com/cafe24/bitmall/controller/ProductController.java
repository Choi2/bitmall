package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.vo.ItemVo;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/detail")
	public String detail(
			@RequestParam("no") long no,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		model.addAttribute("vo", vo);
		return "product/detail"; 
	}
}
