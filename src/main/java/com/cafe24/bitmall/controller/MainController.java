package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping( "" )
	public String index() {
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
