package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.vo.ItemVo;

@Controller
public class MainController {
	
	@Autowired ItemService itemService;
	
	@RequestMapping( "" )
	public String index(Model model) {
		List<ItemVo> itemList = itemService.getList();
		model.addAttribute("itemList", itemList);
		return "main/index";
	}
	
	@RequestMapping( "/cart" )
	public String cart() {
		return "cart";
	}
	
	@RequestMapping( "/order" )
	public String order() {
		return "order";
	}
	
	@RequestMapping( "/product_detail" )
	public String productDetail() {
		return "product_detail";
	}
}
