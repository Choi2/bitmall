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
	
	
	@RequestMapping( "/pay" )
	public String cart() {
		return "order/order_pay";
	}
	
	
}
