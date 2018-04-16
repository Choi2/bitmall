package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.interceptor.Auth;
import com.cafe24.bitmall.interceptor.Auth.Role;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.service.OrderItemService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.BankVo;
import com.cafe24.bitmall.vo.CardVo;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.OrderVo;

@Controller
@SessionAttributes("authMember")
public class MainController {
	
	@Autowired private ItemService itemService;
	@Autowired private CategoryService categoryService;
	@Autowired private OrderService orderService;
	@Autowired private OrderItemService orderItemService;
	@Autowired private MemberOptionService memberOptionService;
	
	@RequestMapping( "" )
	public String index(Model model) {
		List<ItemVo> itemList = itemService.getList();
		List<CategoryVo> categoryList = categoryService.getList();
		model.addAttribute("itemList", itemList);
		model.addAttribute("categoryList", categoryList);
		return "main/index";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping("/jumun")
	public String jumun(
			@ModelAttribute("authMember") MemberVo member,
			Model model) {
		List<OrderVo> orderList = orderService.getListByMemberNo(member.getNo());
		model.addAttribute("list", orderList);
		return "jumun/list";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping("/jumun/info")
	public String jumunInfo(
			@RequestParam("no") long orderNo, 
			@ModelAttribute("authMember") MemberVo member,
			Model model) {
		OrderVo order = orderService.getOne(orderNo);
		
		if(order.getBankNo()!=0) {
			BankVo bank = orderService.getBank(order.getBankNo());
			model.addAttribute("bank", bank);
		} else {
			CardVo card = orderService.getCard(order.getCardNo());
			model.addAttribute("card", card);
		}
		
		List<OrderItemVo> orderItem = orderItemService.getListByOrderNo(orderNo);
		
		List<ItemVo> itemList = itemService.getRenewList(orderItem);
		List<MemberOptionVo> options = memberOptionService.get(orderItem);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(orderItem, options);//회원에 대한 주문상품 리스트
		
		model.addAttribute("vo", order); //주문 내역
		model.addAttribute("list", itemList); //주문된 아이템
		model.addAttribute("member", member);
		model.addAttribute("order", order);
		model.addAttribute("optionResult", optionResult); //아이템의 옵션들
		
		return "jumun/info";
	}
}
