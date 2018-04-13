package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.ItemOptionService;
import com.cafe24.bitmall.service.ItemService;
import com.cafe24.bitmall.service.MemberOptionService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ItemOptionVo;
import com.cafe24.bitmall.vo.ItemVo;
import com.cafe24.bitmall.vo.MemberOptionVo;
import com.cafe24.bitmall.vo.MemberVo;

@Controller
@RequestMapping("/product")
@SessionAttributes("authMember")
public class ProductController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemOptionService itemOptionService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberOptionService memberOptionService;
	
	@RequestMapping("/detail")
	public String detail(
			@RequestParam("no") long no,
			Model model) {
		ItemVo vo = itemService.getOneItem(no);
		List<ItemOptionVo> itemOptionList = itemOptionService.get(vo.getNo());
		model.addAttribute("vo", vo);
		model.addAttribute("itemOptionList", itemOptionList);
		return "product/detail"; 
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cartPage(@ModelAttribute("authMember") MemberVo member,
			Model model) {
		
		List<CartVo> cartList = cartService.getList(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		return "product/cart"; 
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.POST)
	public String cart(
			@RequestParam("itemNo") long no,
			@ModelAttribute("itemCount") int itemCount,
			@ModelAttribute MemberOptionVo memberOption,
			@ModelAttribute("authMember") MemberVo member,
			Model model) {
		
		ItemVo vo = itemService.getOneItem(no);
		vo.setItemCount(itemCount);
		cartService.addItem(vo, member.getNo(), memberOption);
		List<CartVo> cartList = cartService.getList(member.getNo());
		
		List<ItemVo> newItemList = itemService.getRenewList(cartList);
		List<MemberOptionVo> options = memberOptionService.get(cartList);
		List<List<MemberOptionVo>> optionResult = memberOptionService.makeResult(cartList, options);
		model.addAttribute("list", newItemList);
		model.addAttribute("optionResult", optionResult);
		
		System.out.println(newItemList);
		System.out.println(optionResult);
		
		return "product/cart"; 
	}

}
